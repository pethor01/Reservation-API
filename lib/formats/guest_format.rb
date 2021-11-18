module Formats
  class GuestFormat

    def initialize(guest_params)
      @guest_params = guest_params
    end

    def create
      new_guest =  @guest_params[:start_date].present? ? payload_one 
        : payload_two
      check_response(new_guest)
    end

    private
    
    def payload_one
      guest = Guest.new(
        first_name:     @guest_params[:guest][:first_name],
        last_name:      @guest_params[:guest][:last_name],
        email:          @guest_params[:guest][:email],
        phone_numbers:  @guest_params[:guest][:phone]
      )
      
      return guest if guest.save!
      rescue => error
        puts error.message
        return false
    end

    def payload_two
      guest_params = @guest_params[:reservation]
      phone_number = uniq_phone_number(guest_params[:guest_phone_numbers])
      guest = Guest.new(
        first_name:     guest_params[:guest_first_name],
        last_name:      guest_params[:guest_last_name],
        email:          guest_params[:guest_email],
        phone_numbers:  phone_number,
      )
      
      return guest if guest.save!
      rescue => error
        puts error.message
        return false
    end

    def uniq_phone_number(phone_number)
      phone_number.uniq.join(',')
   end

    def check_response(new_guest)
      if new_guest
        return [valid: true, guest: new_guest]
      else
        return new_guest
      end
    end
  end
end