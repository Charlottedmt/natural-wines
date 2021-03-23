class Bottle < ApplicationRecord
  belongs_to :stock
  has_many :locations, through: :stock
end
