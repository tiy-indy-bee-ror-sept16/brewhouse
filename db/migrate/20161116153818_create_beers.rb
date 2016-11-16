class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.boolean :is_organic
      t.string :name
      t.references :category, foreign_key: true
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
