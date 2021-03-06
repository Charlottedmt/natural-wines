class Location < ApplicationRecord
  has_many :stocks
  has_one_attached :photo
  # has_many :bottles, through: :stock
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
