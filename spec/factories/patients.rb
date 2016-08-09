FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    date_of_birth "2016-08-07"
    gender "Male"
    status "Initial"
    location_id 1
    viewed_count 1
  end
end
