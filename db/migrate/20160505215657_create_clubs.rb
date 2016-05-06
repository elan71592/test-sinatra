class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do | t |
      t.string :name, null: false
      t.text :description, null: false
      t.text :address, null: false
      t.string :phone, null: false
      t.references :promoter
      t.timestamps( null: false )
    end
  end
end
