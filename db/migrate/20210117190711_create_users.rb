class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :mail
      t.string :address
      t.string :identification
      t.string :company

      t.timestamps
    end
  end
end
