require 'rails_helper'

RSpec.describe "Patients", :type => :request do
  describe "Manage patients" do
    let(:born_date){
        Time.now - 3.year
    }

    it "adds a patiennt and displays it" do
      # DatabaseCleaner.clean
      create(:location, name: "Location1")
      create(:location, name: "Location2")
      visit patients_path
      expect{
          click_link 'New Patient'
          fill_in 'First name', with: "first_test"
          fill_in 'Middle name', with: "mid_test"
          fill_in 'Last name', with: "last_test"
          select born_date.year.to_s, from: 'patient_date_of_birth_1i'
          select born_date.strftime("%B"), from: 'patient_date_of_birth_2i'
          select born_date.day.to_s, from: 'patient_date_of_birth_3i'
          # select 'Male', from: "Gender"
          choose 'patient_gender_male'
          select 'Initial', from: "Status"
          select 'Location1', from: "Location"
          click_button 'Create Patient'
      }.to change(Patient, :count).by(1)
      page.should have_content "Patient was successfully created."
      page.should have_content "last_test"
      page.should have_content "first_test"
      page.should have_content "Male"
      page.should have_content "Initial"
      page.should have_content "Location1"

      click_link 'Back'
      page.should have_content "last_test, first_test mid_test"
      page.should have_content "MR000001"
      page.should have_content "1"
      page.should have_content "Male"
      page.should have_content "Initial"
      within 'a[href="/locations/1"]' do
          page.should have_content "Location1"
      end
    end

    it "list all patient on 'index' page" do
        create :location
        2.times{ create(:patient)}
        visit patients_path
        page.should have_content "MyString, MyString MyString", count: 2
        page.should have_xpath '//a[@href="/locations/1"]', count: 2
        page.should have_xpath '//a[@href="/locations"]', text: "Locations"
        page.should have_xpath '//a[@href="/patients/onTreatment"]', text: "OnTreatment"
    end

    it "deletes a patient", js: true do
        create :location
        create :patient
        visit patients_path
        page.should have_content "MR000001"
        expect{
            # sleep(inspection_time=5)
            click_link 'Destroy'
            # sleep(inspection_time=5)
            alert = page.driver.browser.switch_to.alert
            # sleep(inspection_time=5)
            alert.accept
            sleep 1
        }.to change(Patient, :count).by(-1)
        page.should have_content "Listing Patients"
        page.should_not have_content "MR000001"
    end

    it "edits a patient and makes changes" do
        create :location
        create :patient
        visit patients_path
        page.should have_css 'a[href="/patients/1/edit"]', text: "Edit", count: 1
        click_link "Edit"
        page.should have_content "Editing Patient"
        expect(find(:css, 'input#patient_first_name').value).to eq("MyString")
        expect(find(:css, 'input#patient_middle_name').value).to eq("MyString")
        expect(find(:css, 'input#patient_last_name').value).to eq("MyString")
        expect(find(:css, 'select#patient_date_of_birth_1i option[selected="selected"]').value).to eq("2016")
        expect(find(:css, 'select#patient_date_of_birth_2i option[selected="selected"]').value).to eq("8")
        expect(find(:css, 'select#patient_date_of_birth_3i option[selected="selected"]').value).to eq("7")
        expect(find(:css, 'input[type="radio"][checked="checked"]').value).to eq("Male")
        expect(find(:css, 'select#patient_status option[selected="selected"]').value).to eq("Initial")
        expect(find(:css, 'select#patient_location_id option[selected="selected"]').value).to eq("1")
        fill_in 'First name', with: "Updated_first_name"
        click_button 'Update Patient'
        page.should have_content 'Patient was successfully updated.'
        page.should have_content 'Updated_first_name'
    end

    it "show patients onTreatment" do
        create :location
        create :patient
        create :patient, status: "Treatment"
        visit patients_path
        click_link 'OnTreatment'
        page.should have_content "Patients onTreatment:"
        page.should have_content "MR000002"
        page.should_not have_content "MR000001"
    end
  end
end
