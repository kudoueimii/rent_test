class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.text :name
      t.text :rent
      t.text :address
      t.text :age
      t.text :note

      t.timestamps
    end
  end
end
