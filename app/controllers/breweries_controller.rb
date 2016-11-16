class BreweriesController < ApplicationController

  def filter
    Rails.logger.info params.inspect
    @breweries = Brewery.all
    if params[:search]
      Rails.logger.info ":waves:"
      @breweries = @breweries.search_by_name(params[:search])
    end
    @breweries.order(params[:order] || { created_at: :desc })
    @breweries = @breweries.ransack(params[:filter]).result
    @breweries = @breweries.to_a.uniq
    render json: @breweries
  end

end
