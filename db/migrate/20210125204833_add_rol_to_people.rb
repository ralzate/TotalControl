class AddRolToPeople < ActiveRecord::Migration[6.1]
    def change
      add_column :people, :rol, :string
    end
  end
  