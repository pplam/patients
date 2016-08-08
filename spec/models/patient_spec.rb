require 'rails_helper'

RSpec.describe Patient, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do
    it "is valid with a valid first_name, last_name, status and location" do
        patient = Patient.new(
            first_name: "First name",
            last_name: "Last name",
            gender: "Male",
            status: "Initial",
            location_id: 1
        )
        expect(patient).to be_valid
    end

    it "is invalid without a first_name" do
        patient = Patient.new(first_name: nil)
        patient.valid?
        expect(patient.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
        patient = Patient.new(last_name: nil)
        patient.valid?
        expect(patient.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a status" do
        patient = Patient.new(status: nil)
        patient.valid?
        expect(patient.errors[:status]).to include("can't be blank")
    end

    it "is invalid without a location_id" do
        patient = Patient.new(location_id: nil)
        patient.valid?
        expect(patient.errors[:location_id]).to include("can't be blank")
    end

    it "is invalid with a first_name exceeded 30 characters" do
        patient = Patient.new(first_name: "This first name should be too long")
        patient.valid?
        expect(patient.errors[:first_name]).to include("is too long (maximum is 30 characters)")
    end

    it "is invalid with a middle_name exceeded 10 characters" do
        patient = Patient.new(middle_name: "This middle name should be too long")
        patient.valid?
        expect(patient.errors[:middle_name]).to include("is too long (maximum is 10 characters)")
    end

    it "is invalid with a last_name exceeded 30 characters" do
        patient = Patient.new(last_name: "This last name should be too long")
        patient.valid?
        expect(patient.errors[:last_name]).to include("is too long (maximum is 30 characters)")
    end

    it "is invalid with a gender not to be 'Not available', 'Male' or 'Female'" do
        patient = Patient.new(gender: "Invalid")
        patient.valid?
        expect(patient.errors[:gender]).to include("is not included in the list")
    end

    it "is invalid with a status not to be 'Initial', 'Referred', 'Treatment' or 'Closed'" do
        patient = Patient.new(status: "Invalid")
        patient.valid?
        expect(patient.errors[:status]).to include("is not included in the list")
    end
  end

  describe "Associations" do
      it "belongs to one location" do
          assc = described_class.reflect_on_association(:location)
          expect(assc.macro).to eq :belongs_to
      end
  end
end
