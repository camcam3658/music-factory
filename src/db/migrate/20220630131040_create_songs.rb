class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :song, null: false
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
