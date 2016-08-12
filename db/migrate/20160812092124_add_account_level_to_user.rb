class AddAccountLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_level, :integer, :default => 0
  end
end
