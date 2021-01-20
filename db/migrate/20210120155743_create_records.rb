class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.decimal :entrance_temperature
      t.decimal :departure_temperature
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
