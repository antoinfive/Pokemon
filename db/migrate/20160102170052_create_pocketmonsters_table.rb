class CreatePocketmonstersTable < ActiveRecord::Migration
  def change
    create_table :pocketmonsters do |t|
      t.string :name
      t.integer :owner_id
    end
  end
end
