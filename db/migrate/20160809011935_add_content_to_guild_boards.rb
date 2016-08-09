class AddContentToGuildBoards < ActiveRecord::Migration
  def change
    add_column :guild_boards, :content, :text
  end
end
