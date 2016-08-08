require 'rails_helper'

RSpec.describe Location, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do
    it "is valid with a valid name" do
        location = Location.new(name: "Location")
        expect(location).to be_valid
    end

    it "is invalid without a name" do
        location = Location.new(name: nil)
        location.valid?
        expect(location.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a code exceeded 10 characters" do
        location = Location.new(code: "This code is too long")
        location.valid?
        expect(location.errors[:code]).to include("is too long (maximum is 10 characters)")
    end

    it "is invalid with a name exceeded 30 characters" do
        location = Location.new(name: "name"*21)
        location.valid?
        expect(location.errors[:name]).to include("is too long (maximum is 80 characters)")
    end
  end

  describe "Associations" do
      it "has many patients" do
          assc = described_class.reflect_on_association(:patients)
          expect(assc.macro).to eq :has_many
      end

      it "destroys dependent patients" do
          #location = FactoryGirl.build(:location)
          #patient = FactoryGirl.build(:patient)
          location = Location.create!(name: "Location")
          patient = Patient.create!(
              first_name: "MyString",
              last_name: "MyString",
              gender: "Male",
              status: "Initial",
              location_id: 1
          )
          # location.patients << patient
          expect {location.destroy}.to change {Patient.count}.by(-1)
      end
  end
end
