require 'rails_helper'

RSpec.describe "Locations", :type => :request do
  describe "Manage locations" do
    it "lists all locations" do
        2.times{ create :location }
        visit patients_path
        click_link 'Locations'
        page.should have_content 'MyString', count: 4
        page.should have_css('tbody tr'), count: 2
        page.should have_css('a[href="/locations/new"]'), text: "New Location"
        page.should have_css('a[href="/patients"]'), text: "Patients"
        click_link 'Patients'
        page.should have_content "Listing Patients"
    end

    it "show details and all patients belong to it" do
        create :location, name: "MyLocation"
        create :patient
        visit patients_path
        click_link 'MyLocation'
        page.should have_content "Location information:"
        page.should have_content "Patients in MyLocation:"
        page.should have_content "MR000001"
    end
  end
end
