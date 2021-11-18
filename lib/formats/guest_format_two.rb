module Formats
  class GuestFormatTwo

    def initialize(guest_params)
      @guest_params = guest_params
    end

    def create
      guest = Guest.find_by(email: @guest_params[:guest_email])
      if guest
        phone_numbers =   @guest_params[:guest][:phone]
        guest.update_phone_numbers(phone_numbers, 1)
      else
        guest_params = @guest_params[:reservation]
        # Guest Model self method  
        new_guest = Guest.guest_payload_two(guest_params)
        check_response(new_guest)
      end
    end

    private

    def check_response(new_guest)
      if new_guest
        return [valid: true, guest: new_guest]
      else
        return new_guest
      end
    end
    
  end
end