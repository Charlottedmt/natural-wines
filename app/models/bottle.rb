class Bottle < ApplicationRecord
  has_many :stock
  has_one_attached :photo
  # has_many :locations, through: :stock
end
