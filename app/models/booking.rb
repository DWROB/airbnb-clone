class Booking < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
end
