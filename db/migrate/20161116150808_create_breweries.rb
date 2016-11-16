class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.boolean :is_organic
      t.string :brewerydb_id
      t.string :name
      t.string :status
      t.string :website

      t.timestamps
    end
  end
end
