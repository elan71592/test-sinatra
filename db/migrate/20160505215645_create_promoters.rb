class CreatePromoters < ActiveRecord::Migration
  def change
    create_table :promoters do | t |
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps( null: false )
    end
  end
end
