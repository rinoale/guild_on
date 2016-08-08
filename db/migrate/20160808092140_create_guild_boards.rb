class CreateGuildBoards < ActiveRecord::Migration
  def change
    create_table :guild_boards do |t|

      t.timestamps null: false
    end
  end
end
