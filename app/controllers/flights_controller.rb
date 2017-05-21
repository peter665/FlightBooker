class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map{ |a| [a.a_code, a.id] }
    @passenger_options = [1,2,3,4]
    @date_options = Flight.date_list

    if params.has_key?(:from_airport) && params[:from_airport] == params[:to_airport]
      flash.now[:danger] = "From and To airports can`t be the same!"

    elsif params.has_key?(:from_airport)
      @flights = Flight.where("start_airport_id = ? AND finish_airport_id = ? AND
                              departure BETWEEN ? AND ?",
                              params[:from_airport], params[:to_airport],
                              Date.parse(params[:departure]).beginning_of_day,
                              Date.parse(params[:departure]).end_of_day
                              ).order(departure: :asc)
      if @flights.size == 0
        flash.now[:danger] = "No flights found, please try another date."
      end
      render :index
    else
      render :index
    end



  end

  private
    def flight_params
      params.permit(:from_airport, :to_airport, :departure, :passangers)
    end

end
