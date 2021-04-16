class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,      null: false
      t.text :item_text,        null: false
      t.integer :item_category_id, null: false
      t.integer :item_statue_id,   null: false
      t.integer :yamato_id,        null:false
      t.integer :area_id,          null: false
      t.integer :days_id,          null:false
      t.integer :cost,          null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end
