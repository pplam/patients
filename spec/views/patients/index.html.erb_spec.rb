require 'rails_helper'

RSpec.describe "patients/index", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(code: "Code", name: "Name"))
    assign(:patients, [
      Patient.create!(
        :first_name => "First Name",
        :middle_name => "MyString",
        :last_name => "Last Name",
        :gender => "Male",
        :status => "Initial",
        :viewed_count => 1,
        :location => @location
      ),
      Patient.create!(
        :first_name => "First Name",
        :middle_name => "MyString",
        :last_name => "Last Name",
        :gender => "Male",
        :status => "Initial",
        :viewed_count => 1,
        :location => @location
      )
    ])
  end

  it "renders a list of patients" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Male".to_s, :count => 2
    assert_select "tr>td", :text => "Initial".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MR000001".to_s, :count => 1
    assert_select "tr>td", :text => "MR000002".to_s, :count => 1
  end
end
