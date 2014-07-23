require 'rails_helper'

RSpec.describe "jobs/index", :type => :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :job_type => 1,
        :company_name => "Company Name",
        :occupation => 2,
        :location => "Location",
        :description => "MyText",
        :apply_information => "MyText",
        :aasm_state => 3,
        :city => 4,
        :identifier => "Identifier"
      ),
      Job.create!(
        :title => "Title",
        :job_type => 1,
        :company_name => "Company Name",
        :occupation => 2,
        :location => "Location",
        :description => "MyText",
        :apply_information => "MyText",
        :aasm_state => 3,
        :city => 4,
        :identifier => "Identifier"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  end
end
