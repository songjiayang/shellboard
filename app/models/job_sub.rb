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

class JobSub < ActiveRecord::Base
  include LanguageAble

  validates :email, :language, :confirm_token, presence: true
  validates :email, format: { with: /\A[\w\d]+?[\w\d\-_.+]*?@[\w\d\-_.]+?\.\w+\z/i }
  validates :email, uniqueness: { scope: :language }

  validates :language, :inclusion => { :in => 0..Job::LANGUAGE.length }

  before_validation :set_confirm_token, on: :create

  def confirm!
    self.update_attributes!(confirm: true)  
  end

  def domin
    "http://#{self.language_humanize}.#{ActionMailer::Base.default_url_options[:host]}"
  end

  private

  def set_confirm_token
    self.confirm_token = SecureRandom.hex(32)
  end
end
