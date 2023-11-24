class CreateApis < ActiveRecord::Migration[7.1]
  def change
    create_table :apis do |t|
      t.integer :latitude
      t.integer :longitude
      t.string :endereco

      t.timestamps
    end
  end
end
