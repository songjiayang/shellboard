class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update]

  def index
    @jobs = Job.confirmed.with_language(current_language).newest.page(params[:page])
    respond_to do |format|
      format.html 
      format.xml { render xml: @jobs.to_xml(:only => [:id, :title, :title, :url, :description ,:created_at ]) }
    end
  end

  def show
    render_404 if !admin? && params[:identifier] != @job.identifier && !@job.confirm
  end

  def new
    @job = Job.new
  end

  def edit
    @identifier  = params[:identifier]
    raise BadRequest if !admin? && @job.identifier != @identifier
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      @job.language = current_language
      if @job.save
        JobsMailer.delay.sent_manage_token(@job.id) if @job.email
        format.html { redirect_to job_path(id: @job.id, identifier: @job.identifier), notice: '工作信息已经创建成功，等待管理员验证。' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    raise BadRequest if !admin? && @job.identifier != params[:identifier]
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_path(id: @job.id, identifier: @job.identifier), notice: '工作信息修改成功！' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :job_type, :company_name, :occupation, :email,
                        :location, :description, :apply_information, :deadline, :city, :url)
    end
end
