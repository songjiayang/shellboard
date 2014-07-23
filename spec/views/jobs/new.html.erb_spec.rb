require 'rails_helper'

RSpec.describe "jobs/new", :type => :view do
  before(:each) do
    assign(:job, Job.new(
      :title => "MyString",
      :job_type => 1,
      :company_name => "MyString",
      :occupation => 1,
      :location => "MyString",
      :description => "MyText",
      :apply_information => "MyText",
      :aasm_state => 1,
      :city => 1,
      :identifier => "MyString"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "input#job_job_type[name=?]", "job[job_type]"

      assert_select "input#job_company_name[name=?]", "job[company_name]"

      assert_select "input#job_occupation[name=?]", "job[occupation]"

      assert_select "input#job_location[name=?]", "job[location]"

      assert_select "textarea#job_description[name=?]", "job[description]"

      assert_select "textarea#job_apply_information[name=?]", "job[apply_information]"

      assert_select "input#job_aasm_state[name=?]", "job[aasm_state]"

      assert_select "input#job_city[name=?]", "job[city]"

      assert_select "input#job_identifier[name=?]", "job[identifier]"
    end
  end
end
