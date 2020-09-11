class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.text :description,       null: false
      t.integer :category,       null: false
      t.integer :status,         null: false
      t.integer :shopping_cost,  null: false
      t.integer :area,           null: false
      t.integer :shopping_day,   null: false
      t.integer :price,          null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
