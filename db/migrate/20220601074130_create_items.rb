class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :brandname,         null: false
      t.text    :description,         null: false
      t.integer :details_category_id,         null: false
      t.integer :details_condition_id,         null: false
      t.integer :delivery_charge_id,         null: false
      t.integer :delivery_area_id,         null: false
      t.integer :delivery_number_of_date_id,         null: false
      t.integer :price ,         null: false
      t.references :user, foreign_key: true



      t.timestamps
    end
  end
end
