class ForecastsController < ApplicationController
  def index
    city = params[:city] || "New York"
    state = params[:state] || "NY"
    url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
    @data = Unirest.get(url).body
    # binding.pry
    @item = @data["query"]["results"]["channel"]["item"]
    @condition = @item["condition"]
    @forecasts = @item["forecast"]
    render "index.html.erb"
  end
end