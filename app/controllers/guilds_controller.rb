class GuildsController < ApplicationController
  before_filter :find_guild_before_action, only: %i(show edit update destroy)
  before_filter :create_left_menu, only: %i(index show new edit)

  def index
    @guilds = Guild.all
  end

  def show
    @left_menu_node.detect { |node| node[:id] == 'guilds#show' }.merge! active: 'active'
  end

  def new
    @guild = Guild.new

    @left_menu_node.detect { |node| node[:id] == 'guilds#new' }.merge! active: 'active'
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

  def create_left_menu
    if %w(show edit).include? params[:action]
      @left_menu_node = [
        { id: 'guilds#show', menu_name: @guild.guild_name, link: guild_path(@guild) },
        { menu_name: 'Parties', link: guild_path(@guild) },
        { menu_name: 'Votes', link: guild_path(@guild) },
        { id: 'guild_boards#show', menu_name: 'Guild BBS', link: guild_guild_boards_path(@guild) }
      ]
    elsif %w(new index).include? params[:action]
      @left_menu_node = [
        { id: 'guilds#new', menu_name: 'New Guild', link: new_guild_path }
      ]
    end
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
