class AddAuthorToGuildBoards < ActiveRecord::Migration
  def change
    add_column :guild_boards, :author, :string
  end
end
