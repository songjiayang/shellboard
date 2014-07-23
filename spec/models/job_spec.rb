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

require 'rails_helper'

RSpec.describe Job, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
