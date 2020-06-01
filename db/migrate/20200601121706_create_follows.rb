class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :identity, null: false, foreign_key: true
      t.boolean :online_status
      t.string :thumbnail
      t.string :streamer_name
      t.string :stream_title
      t.integer :viewers
      t.string :game_title

      t.timestamps
    end
  end
end
