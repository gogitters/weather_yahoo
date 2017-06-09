class ForecastsController < ApplicationController
  def index
    city = params[:city] || "New York"
    state = params[:state] || "NY"
    @weather = Weather.lookup_by_location("#{city}, #{state}", Weather::Units::FAHRENHEIT)
    render "index.html.erb"
  end
end
