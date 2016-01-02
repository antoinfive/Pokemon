class AddPocketmonstersIdToOwnerTable < ActiveRecord::Migration
  def change
      add_column :owners, :pocketmonster_ids, :string
  end
end
