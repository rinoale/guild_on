class AddTitleToGuildBoards < ActiveRecord::Migration
  def change
    add_column :guild_boards, :title, :string
  end
end
