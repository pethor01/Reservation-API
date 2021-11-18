module Formats
  class ReservationFormat

    def initialize(guest_id, guest_dtl_id, guest_params)
      @guest_id = guest_id
      @guest_dtl_id = guest_dtl_id
      @guest_params = guest_params
    end

    def create
      @guest_params[:start_date].present? ? payload_one : payload_two
    end
    
    private

    def payload_one
      reservation = Reservation.new(
        guest_detail_id:     @guest_dtl_id,
        guest_id:            @guest_id,
        start_date:          @guest_params[:start_date],
        end_date:            @guest_params[:end_date],
        payout_amount:       @guest_params[:payout_price],
        currency:            @guest_params[:currency],
        nights:              @guest_params[:nights],
        status:              @guest_params[:status],
        total_paid_amount:   @guest_params[:payout_price],
        security_amount:     @guest_params[:security_price],
        total_amount:        @guest_params[:total_price]
      ) 
  
      return reservation if reservation.save!
      rescue => error
        puts error.message
        return false
    end

    def payload_two
      guest_params = @guest_params[:reservation]
      reservation = Reservation.new(
        guest_detail_id:     @guest_dtl_id,
        guest_id:            @guest_id,
        start_date:          guest_params[:start_date],
        end_date:            guest_params[:end_date],
        payout_amount:       guest_params[:expected_payout_amount],
        currency:            guest_params[:host_currency],
        nights:              guest_params[:nights],
        status:              guest_params[:status_type],
        total_paid_amount:   guest_params[:total_paid_amount_accurate],
        security_amount:     guest_params[:listing_security_price_accurate],
        total_amount:        guest_params[:total_paid_amount_accurate]
      ) 
      return reservation if reservation.save!
      rescue => error
        puts error.message
        return false
    end
  end
end