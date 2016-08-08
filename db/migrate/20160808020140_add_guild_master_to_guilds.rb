class AddGuildMasterToGuilds < ActiveRecord::Migration
  def change
    add_column :guilds, :guild_master, :string
  end
end
