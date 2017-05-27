class BookingsController < ApplicationController
  def new
     @flight = Flight.find(params[:flt])
     @booking = Booking.new
     params[:passangers].to_i.times { @booking.passangers.build }

  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = Booking.new(flight_id: booking_params[:flight_id])

    booking_params[:passangers_attributes].each do |k, v|
      if pas = Passanger.find_by(email: v['email'])
        @booking.passangers << pas
      else
        @booking.passangers.build(email: params[:booking][:passangers_attributes][k][:email],
                                  name:  params[:booking][:passangers_attributes][k][:name])
      end
    end

    if @booking.save
      @booking.passangers.each do |pas|
        PassengerMailer.thank_you_email(pas, @booking).deliver_now
      end

      flash[:success] = "Booking successful!"
      redirect_to booking_path(@booking)
    else
      flash[:danger] = "Flight booking error! #{@booking.errors.messages}"
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking)
        .permit(:flight_id, passangers_attributes: [:name, :email, :id])
    end

end
