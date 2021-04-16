class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :sikutyouson
      t.string :yubin
      t.string :phone
      t.string :building
      t.integer :banti
      t.integer :area
      t.references :order ,foreign_key: true
      t.timestamps
    end
  end
end
