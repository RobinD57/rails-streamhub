class AddTablesToFollows < ActiveRecord::Migration[6.0]
  def change
    add_column :follows, :box_art, :string
    add_column :follows, :avatar, :string
  end
end
