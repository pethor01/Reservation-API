module Formats
  class GuestDetailFormat

    def initialize(guest_params)
      @guest_params = guest_params
    end

    def create
      @guest_params[:start_date].present? ? payload_one : payload_two
    end
    
    private

    def payload_one
      guest_dtl = GuestDetail.new(
        number_of_guests:    @guest_params[:guests],
        adults:              @guest_params[:adults],
        children:            @guest_params[:children],
        infants:             @guest_params[:infants]
      )
      return guest_dtl if guest_dtl.save!
      rescue => error
        puts error.message
        return false
    end

    def payload_two
      guest_params = @guest_params[:reservation]
      guest_dtl = GuestDetail.new(
        number_of_guests:    guest_params[:number_of_guests],
        adults:              guest_params[:guest_details][:number_of_adults],
        children:            guest_params[:guest_details][:number_of_children],
        infants:             guest_params[:guest_details][:number_of_infants],
        description:         guest_params[:guest_details][:localized_description]
      )
      return guest_dtl if guest_dtl.save!
      rescue => error
        puts error.message
        return false
    end
  end
end