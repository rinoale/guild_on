class AddGuildIdToGuildBoards < ActiveRecord::Migration
  def change
    add_column :guild_boards, :guild_id, :integer
  end
end
