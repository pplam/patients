class Location < ActiveRecord::Base
    has_many :patients, dependent: :destroy
    validates :code, length: { maximum: 10 }
    validates :name, presence: true, length: { maximum: 80 }
end
