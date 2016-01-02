class CreateOwnersTable < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :avatar_url
    end
  end
end
