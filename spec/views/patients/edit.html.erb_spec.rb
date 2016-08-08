require 'rails_helper'

RSpec.describe "patients/edit", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(name: "Name", code: "Code"))
    @patient = assign(:patient, Patient.create!(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :gender => "Male",
      :status => "Initial",
      :location => @location
    ))
  end

  it "renders the edit patient form" do
    render

    assert_select "form[action=?][method=?]", patient_path(@patient), "post" do

      assert_select "input#patient_first_name[name=?]", "patient[first_name]"

      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"

      assert_select "input#patient_last_name[name=?]", "patient[last_name]"

      assert_select "select#patient_gender[name=?]", "patient[gender]"

      assert_select "select#patient_status[name=?]", "patient[status]"

      assert_select "select#patient_location_id[name=?]", "patient[location_id]"
    end
  end
end
