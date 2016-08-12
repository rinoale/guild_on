class AddEmailidToUser < ActiveRecord::Migration
  def change
    add_column :users, :emailid, :string
  end
end
