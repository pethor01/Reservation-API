class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :guest_detail
  
end
