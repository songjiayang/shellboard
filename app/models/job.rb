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
#

class Job < ActiveRecord::Base

  validates :title, :company_name, :location, :description, 
              :apply_information, :identifier, presence: true

  JOB_TYPE = %w(Full-time Part-time Contract Internship Other)
  OCCUPATION = ['Web back-end', 'Web front-end', 'Web-design',
                'QA/Testing', 'Other'] 
  ASSM_STATE = %w(published closed)
  CITY = %w(北京 上海 杭州 成都 广州 深圳 南京 武汉 西安 大连 青岛 苏州 其他)
  LANGUAGE = %w(ruby) 
 
  validates :job_type, :inclusion => { :in => 0...JOB_TYPE.length }
  validates :occupation, :inclusion => { :in => 0...OCCUPATION.length }
  validates :aasm_state, :inclusion => { :in => [0, 1] }
  validates :city, :inclusion => { :in => 0...CITY.length }
  validates :language, :inclusion => { :in => 0...LANGUAGE.length }
  validates :url, :format => { :with => %r{\Ahttps?://[^/?:]+?\.\w+?(?::[0-9]{1,5})?\/?[^\s:]*?\z}i }, unless: nil

end
