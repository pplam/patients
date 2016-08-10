require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PatientsHelper. For example:
#
# describe PatientsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PatientsHelper, :type => :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#mr" do
      it "return a string started with 'MR' and followed with the parameter padded with 6 zeros" do
          expect(helper.mr(1)).to eq("MR000001")
      end
  end

  describe "#full_name" do
      it "return a full name with stye 'last, first middle'" do
          expect(helper.full_name("first", "middle", "last")).to eq("last, first middle")
      end
  end

  describe "#age" do
      it "return an empty string if the parameter is nil" do
          expect(helper.age(nil)).to eq("")
      end

      it "return an age by year" do
          # born_date = DateTime.new(2000, 1, 1).to_date
          # now = DateTime.now.to_date
          expect(helper.age(Date.today - 366)).to eq(1)
      end
  end
end
