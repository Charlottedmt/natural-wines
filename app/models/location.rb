class Location < ApplicationRecord
  belongs_to :stock
  has_many :bottles, through: :stock
end
