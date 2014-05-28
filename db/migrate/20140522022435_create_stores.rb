class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :product_name
      t.string :product_type
      t.text :description
      t.decimal :price
      t.string :features
      t.attachment :image
      t.timestamps
    end
  end
end
