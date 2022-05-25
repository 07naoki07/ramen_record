class CreateGenreRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_records do |t|
      t.references :record, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
