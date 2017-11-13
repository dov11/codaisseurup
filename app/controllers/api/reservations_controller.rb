class Api::ReservationsController < Api::BaseController
  before_action :set_event

  def create
    total_price = set_price(reservation_params)
    reservation = @event.reservations.new(reservation_params.merge(price: total_price))

    if reservation.save
      render status: 200, json: {
        message: "Reservation successfully created",
        event: @event,
        reservation: reservation
      }.to_json
    else
      render status: 422, json: {
        message: "Reservation could not be created",
        errors: reservation.errors
      }.to_json
    end
  end

  def update
    total_price = set_price(reservation_params)
    reservation = @event.reservations.find(params[:id])
    if reservation.update(reservation_params.merge(price: total_price))
      render status: 200, json: {
        message: "Reservation updated",
        event: @event,
        reservation: reservation
      }.to_json
    else
      render status: 422, json: {
        message: "Reservation could not be updated",
        errors: reservation.errors
      }.to_json
    end
  end

  def destroy
    reservation = @event.reservations.find(params[:id])
    reservation.destroy

    render status: 200, json: {
      message: "Reservation successfully deleted",
      event: @event,
      reservation: reservation
    }.to_json
  end

  private

  # def get_total_price(reservation_params)
  #   checkin = DateTime.parse(reservation_params[:starts_at])
  #   checkout = DateTime.parse(reservation_params[:ends_at])
  #
  #   total_days = (checkout - checkin).to_i
  #   reservation_params[:price].to_i * total_days
  # end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_price(reservation_params)
    @event.price*reservation_params[:guests_count]
  end

  def reservation_params
    params.require(:reservation).permit(:guests_count)
  end
end
