class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @reservation = current_user.reservations.build(reservation_params.merge(event_id: params[:event_id]))
    
    @reservation.set_price
    @reservation.save
    redirect_to @reservation.event, notice: "Thank you for reservation!"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :guests_count)
  end

end
