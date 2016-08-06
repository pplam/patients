json.extract! patient, :id, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :status, :viewed_count, :created_at, :updated_at
json.url patient_url(patient, format: :json)