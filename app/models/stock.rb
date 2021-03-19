class Stock < ApplicationRecord
  belongs_to :location
  belongs_to :bottle
end
