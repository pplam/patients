class Patient < ActiveRecord::Base
    acts_as_paranoid
    belongs_to :location
    validates :first_name, :last_name, :status, :location_id, presence: true
    validates :first_name, :last_name, length: { maximum: 30 }
    validates :middle_name, length: { maximum: 10 }
    validates :gender, inclusion: { in: %w(Not\ available Male Female) }
    validates :status, inclusion: { in: %w(Initial Referred Treatment Closed) }
end
