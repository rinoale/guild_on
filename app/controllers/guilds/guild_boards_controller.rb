module Guilds
  class GuildBoardsController < ApplicationController
    helper_method :guild

    before_filter :authorize, only: %i(new create)

    def index
      @guild_boards = guild.guild_board
    end

    def show
      @guild_board = guild.guild_board.find(params[:id])
    end

    def new
      @guild_board = guild.guild_board.new
    end

    def edit
      @guild_board = guild.guild_board.find(params[:id])
    end

    def create
      @guild_board = guild.guild_board.new(board_params)
      @guild_board.author = current_user.username

      if @guild_board.save
        redirect_to guild_guild_board_url(guild, @guild_board)
      else
        render 'new'
      end
    end

    def update
      @guild_board = guild.guild_board.find(params[:id])

      if @guild_board.update(board_params)
        redirect_to guild_guild_board_url(guild, @guild_board)
      else
        render 'edit'
      end
    end

    def destroy
      @guild_board = guild.guild_board.find(params[:id])
      @guild_board.destroy

      redirect_to guild_guild_boards_path
    end

    private

    def board_params
      params.require(:guild_board).permit(:title, :content)
    end

    def left_menu_node
      @left_menu_node = [
        { id: 'guilds#show', menu_name: guild.guild_name, link: guild_path(guild) },
        { menu_name: 'Parties', link: guild_path(guild) },
        { menu_name: 'Votes', link: guild_path(guild) },
        { id: 'guild_boards#show', menu_name: 'Guild BBS', link: guild_guild_boards_path(guild), active: 'active' }
      ]
    end

    def guild
      @guild = Guild.find_by_guild_address(params[:guild_guild_address])
    end
  end
end
