class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Settings.authentication.name, password: Settings.authentication.password, except: [:index, :show]

  def index
    @jobs = Job.latest.page(params[:page]).per(25)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      @job.language = 0
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :job_type, :company_name, :occupation, 
                        :location, :description, :apply_information, :deadline, :city, :url)
    end
end
