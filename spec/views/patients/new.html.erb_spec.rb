require 'rails_helper'

RSpec.describe "patients/new", :type => :view do
  before(:each) do
    assign(:patient, Patient.new(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :gender => "Male",
      :status => "Initial",
      :location_id => 1
    ))
  end

  it "renders new patient form" do
    render

    assert_select "form[action=?][method=?]", patients_path, "post" do

      assert_select "input#patient_first_name[name=?]", "patient[first_name]"

      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"

      assert_select "input#patient_last_name[name=?]", "patient[last_name]"

      assert_select "input[type=?][name=?]", "radio", "patient[gender]", count: 3

      assert_select "select#patient_status[name=?]", "patient[status]"

      assert_select "select#patient_date_of_birth_1i[name=?]", "patient[date_of_birth(1i)]"
      assert_select "select#patient_date_of_birth_2i[name=?]", "patient[date_of_birth(2i)]"
      assert_select "select#patient_date_of_birth_3i[name=?]", "patient[date_of_birth(3i)]"

      assert_select "select#patient_location_id[name=?]", "patient[location_id]"
    end
  end
end
