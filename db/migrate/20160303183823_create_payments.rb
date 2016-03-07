class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :post, index: true, foreign_key: true
      t.references :usuario, index: true, foreign_key: true
      t.integer :estado

      t.timestamps null: false
    end
  end
end
