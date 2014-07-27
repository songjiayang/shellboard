# == Schema Information
#
# Table name: job_subs
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  language      :integer
#  confirm       :boolean
#  confirm_token :string(255)
#  enable        :boolean
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_job_subs_on_confirm                               (confirm)
#  index_job_subs_on_email_and_confirm_token_and_language  (email,confirm_token,language) UNIQUE
#  index_job_subs_on_enable                                (enable)
#  index_job_subs_on_language                              (language)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_sub do
    email "MyString"
    language 1
    confirm false
    confirm_token "MyString"
    state 1
  end
end
