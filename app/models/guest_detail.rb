class GuestDetail < ApplicationRecord
  has_many :reservations, dependent: :destroy

end
