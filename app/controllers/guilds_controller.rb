class GuildsController < ApplicationController
  def index
    @guilds = Guild.all
  end

  def show
    @guild = Guild.find_by_guild_address(params[:guild_address])

    @left_menu_node = [
      { menu_name: @guild.guild_name, link: guild_path(@guild) },
      { menu_name: 'Parties', link: guild_path(@guild) },
      { menu_name: 'Votes',   link: guilds_path },
      { menu_name: 'Guild BBS' }
    ]
  end

  def new
    @guild = Guild.new
  end

  def edit
    @guild = Guild.find(params[:id])
  end

  def create
    @guild = Guild.new(guild_params)

    if @guild.save
      redirect_to @guild
    else
      render 'new'
    end
  end

  def update
    @guild = Guild.find(params[:id])

    if @guild.update(guild_params)
      redirect_to @guild
    else
      render 'edit'
    end
  end

  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy

    redirect_to guilds_path
  end

  private

  def guild_params
    params.require(:guild).permit(:guild_address, :guild_name, :guild_master)
  end

  def left_menu_node
    @left_menu_node ||= [
      { menu_name: 'New Guild', link: new_guild_path }
    ]
  end
end
