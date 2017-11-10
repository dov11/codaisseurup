class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @reservation = current_user.reservations.create(reservation_params)

    redirect_to @reservation.event, notice: "Thank you for reservation!"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:status, :price, :guests_count, :event_id)
  end
end
