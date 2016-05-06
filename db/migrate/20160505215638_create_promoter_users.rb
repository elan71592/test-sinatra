class CreatePromoterUsers < ActiveRecord::Migration
  def change
    create_table :promoter_users do | t |
      t.references :promoter
      t.references :user
      t.timestamps( null: false )
    end
  end
end
