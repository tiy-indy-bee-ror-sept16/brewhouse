# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# beer_url = "http://api.brewerydb.com/v2/breweries?established=2016&key=#{ENV[:brewery_api_key]}"

brewery_db = BreweryDB::Client.new do |config|
  config.api_key = ENV['brewery_api_key']
end


response = brewery_db.locations.all(locality: 'Indianapolis')

response.each do |thing|
  brewery = Brewery.create!(
    is_organic: thing.brewery.is_organic == "Y",
    brewerydb_id: thing.brewery.id,
    name: thing.brewery.name,
    status: thing.brewery.status,
    website: thing.brewery.website
  )
  brewery_db.brewery(brewery.brewerydb_id).beers.each do |beer|
    if beer.style
      category = Category.find_or_create_by(
                  name: beer.style.name,
                  description: beer.style.description
                  )
    else
      category = nil
    end

    brewery.beers.create!(
      is_organic: beer.is_organic == "Y",
      name: beer.name,
      abv: beer.style&.abv_max,
      category: category
    )
  end
end
