class AddGuildNameToGuilds < ActiveRecord::Migration
  def change
    add_column :guilds, :guild_name, :string
    add_index :guilds, :guild_name, unique: true
  end
end
