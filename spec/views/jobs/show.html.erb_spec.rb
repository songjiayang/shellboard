require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Identifier/)
  end
end
