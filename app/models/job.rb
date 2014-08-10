# == Schema Information
#
# Table name: jobs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  job_type          :integer
#  company_name      :string(255)
#  occupation        :integer
#  location          :string(255)
#  description       :text
#  apply_information :text
#  deadline          :date
#  aasm_state        :integer
#  city              :integer
#  identifier        :string(255)
#  url               :string(255)
#  language          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  email             :string(255)
#  confirm           :boolean
#
# Indexes
#
#  index_jobs_on_confirm  (confirm)
#

class Job < ActiveRecord::Base
  include LanguageAble

  validates :title, :company_name, :location, :description, 
              :apply_information, :identifier, presence: true

  JOB_TYPE = %w(全职 兼职 合同 实习 其他)
  OCCUPATION = ['Web back-end', 'Web front-end', 'Web-design',
                'QA/Testing', 'Other'] 
  ASSM_STATE = %w(published closed)
  CITY = %w(北京 上海 杭州 成都 广州 深圳 南京 武汉 西安 大连 青岛 苏州 其他)
  LANGUAGE = %w(ruby python php node erlang lua css) 
 
  validates :job_type, :inclusion => { :in => 0..JOB_TYPE.length }
  validates :language, :inclusion => { :in => 0..LANGUAGE.length }
  validates :occupation, :inclusion => { :in => 0..OCCUPATION.length }
  validates :aasm_state, :inclusion => { :in => [0, 1] }
  validates :city, :inclusion => { :in => 0..CITY.length }
  validates :url, :format => { :with => %r{\Ahttps?://[^/?:]+?\.\w+?(?::[0-9]{1,5})?\/?[^\s:]*?\z}i }, allow_blank: true

  scope :newest, -> { order('id desc')} 
  scope :latest, -> { order('updated_at desc')} 
  scope :with_language, -> (language){ where(language: language) }
  scope :confirmed, -> { where('confirm = true') }
  scope :unconfirmed, -> { where('confirm = false or confirm is null') }

  before_validation :set_identifier, :set_deadline, :set_aasm_state, on: :create


  def confirm!
    self.update_attributes!(confirm: true)  
  end

  private

  def set_identifier
    self.identifier = SecureRandom.hex(32)
  end

  def set_deadline
    self.deadline = (Time.now + 1.month).to_date unless self.deadline
  end

  def set_aasm_state
    self.aasm_state = 0
  end

end
