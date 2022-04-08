class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|

      t.integer :user_id
      t.string :name
      t.string :shop_name
      t.text :review
      t.float :rate
      t.string :address

      t.timestamps

    end
  end
end
