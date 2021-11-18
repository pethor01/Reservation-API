require 'formats/guest_format'
require 'formats/guest_detail_format'
require 'formats/reservation_format'

module Api
  module V1
    class ReservationsController < ApplicationController
      
      def create
        # in lib folderformats/guest_format
        @guest = Formats::GuestFormat.new(params).create
        if @guest
          @response = @guest.first
          guest_details_reservations(params) 
        end
        
        if @guest && @reservation
          full_name = @reservation.guest.full_name
          render json: {message: "Created reservation for #{full_name}"}, status: :ok
        else
          render json: {message: 'Error While Creating Reservation'},  status: 400
        end
        
      end 

      private

      def guest_details_reservations(params)
        guest_id = @response[:guest][:id]
          # in lib folderformats/guest_detail_format
        @guest_detail = Formats::GuestDetailFormat.new(params).create
          # in lib folderformats/reservation_format
        @reservation = Formats::ReservationFormat.new(guest_id, @guest_detail.id, params).create
      end

    end
  end
end