class CreateLocalStations < ActiveRecord::Migration[6.0]
  def change
    create_table :local_stations do |t|
      t.text :line
      t.text :station
      t.text :distance

      t.timestamps
    end
  end
end
