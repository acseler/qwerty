class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 7, scale: 2
      t.integer :stock
      t.references :category, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
