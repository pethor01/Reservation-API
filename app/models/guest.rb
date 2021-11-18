class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :email, uniqueness: true
 
  def full_name
    "#{first_name} #{last_name}"    
  end

end
