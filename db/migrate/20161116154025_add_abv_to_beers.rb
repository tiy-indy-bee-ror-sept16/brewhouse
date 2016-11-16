class AddAbvToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :abv, :decimal, precision: 3, scale: 1
  end
end
