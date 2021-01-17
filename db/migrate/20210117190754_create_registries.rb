class CreateRegistries < ActiveRecord::Migration[6.1]
  def change
    create_table :registries do |t|
      t.decimal :entrance_temperature
      t.decimal :departure_temperature
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
