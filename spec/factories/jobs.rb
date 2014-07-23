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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    job_type 1
    company_name "MyString"
    occupation 1
    location "MyString"
    description "MyText"
    apply_information "MyText"
    deadline "2014-07-23"
    aasm_state 1
    city 1
    identifier "MyString"
  end
end
