class Bottle < ApplicationRecord
  has_many :stock
  has_many :locations, through: :stock
end
