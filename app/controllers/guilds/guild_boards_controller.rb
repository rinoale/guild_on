module Guilds
  class GuildBoardsController < ApplicationController
    def index
      @boards = guild.guild_board
    end
    #
    # def show
    #   @guild = Guild.find_by_guild_address(params[:guild_address])
    #
    #   @left_menu_node = [
    #     { menu_name: @guild.guild_name, link: guild_path(@guild) },
    #     { menu_name: 'Parties', link: guild_path(@guild) },
    #     { menu_name: 'Votes', link: guild_path(@guild) },
    #     { menu_name: 'Guild BBS', link: guild_path(@guild) }
    #   ]
    # end
    #
    def new
      @board = guild.guild_board.new
    end

    def edit
      @board = guild.guild_board.find(params[:id])
    end

    def create
      @board = guild.guild_board.new(board_params)

      if @board.save
        redirect_to @board
      else
        render 'new'
      end
    end

    def update
      @board = guild.guild_board.find(params[:id])

      if @board.update(board_params)
        redirect_to @board
      else
        render 'edit'
      end
    end

    def destroy
      @board = guild.guild_board.find(params[:id])
      @board.destroy

      redirect_to guild_guild_boards_path
    end

    private

    def board_params
      params.require(:board).permit(:title, :content, :author)
    end

    def left_menu_node
      @left_menu_node = [
        { menu_name: guild.guild_name, link: guild_path(guild) },
        { menu_name: 'Parties', link: guild_path(guild) },
        { menu_name: 'Votes', link: guild_path(guild) },
        { menu_name: 'Guild BBS', link: guild_guild_boards_path(guild) }
      ]
    end

    def guild
      @guild = Guild.find_by_guild_address(params[:guild_guild_address])
    end
  end
end
