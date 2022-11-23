class Apartment < ApplicationRecord
  #relationships to other models
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # relationship with Active Storage db of photos.
  has_many_attached :photos

  # geocode
  geocoded_by :address
  # will check if apartment has geocode - meaning we won't waste time requesting.
  after_validation :geocode, if: :will_save_change_to_address?
end
