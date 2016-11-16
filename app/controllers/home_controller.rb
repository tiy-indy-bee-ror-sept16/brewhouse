class HomeController < ApplicationController

  def index
    @breweries = Brewery.all
  end

end
