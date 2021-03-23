class Stock < ApplicationRecord
  has_many :locations
  has_many :bottles
end
