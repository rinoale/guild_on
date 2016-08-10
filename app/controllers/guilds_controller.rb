class GuildsController < ApplicationController
  before_filter :find_guild_before_action, only: %i(show edit update destroy)

  def index
    @guilds = Guild.all

    @left_menu_node ||= [
      { menu_name: 'New Guild', link: new_guild_path }
    ]
  end

  def show
  end

  def new
    @guild = Guild.new

    @left_menu_node ||= [
      { menu_name: 'New Guild', link: new_guild_path }
    ]
  end

  def edit
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
    if @guild.update(guild_params)
      redirect_to @guild
    else
      render 'edit'
    end
  end

  def destroy
    @guild.destroy

    redirect_to guilds_path
  end

  private

  def guild_params
    params.require(:guild).permit(:guild_address, :guild_name, :guild_master)
  end

  def left_menu_node
    @left_menu_node ||= [
      { menu_name: @guild.guild_name, link: guild_path(@guild) },
      { menu_name: 'Parties', link: guild_path(@guild) },
      { menu_name: 'Votes', link: guild_path(@guild) },
      { menu_name: 'Guild BBS', link: guild_guild_boards_path(@guild) }
    ]
  end

  def find_guild_before_action
    @guild = Guild.find_by_guild_address(params[:guild_address])
  end
end
