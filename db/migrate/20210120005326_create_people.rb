class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname
      t.integer :phone
      t.string :email
      t.string :address
      t.string :identification
      t.string :company
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
