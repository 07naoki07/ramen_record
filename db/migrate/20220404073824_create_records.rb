class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

      t.integer :user_id
      t.string :name
      t.string :shop_name
      t.text :caption
      t.float :rate, null: false, default: 0
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps

    end
  end
end
