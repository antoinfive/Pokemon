class AddUrlColumnToPocketmonsters < ActiveRecord::Migration
  def change
    add_column :pocketmonsters, :image_url, :string
  end
end
