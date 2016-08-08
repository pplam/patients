require 'rails_helper'

RSpec.describe "patients/show", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(code: "001", name: "Shanghai"))
    @patient = assign(:patient, Patient.create!(
      :first_name => "First Name",
      :middle_name => "MyString",
      :last_name => "Last Name",
      :gender => "Male",
      :status => "Initial",
      :viewed_count => 1,
      :location => @location
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Male/)
    expect(rendered).to match(/Initial/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Shanghai/)
  end
end
