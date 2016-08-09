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
      @guild = Guild.new
    end

    def edit
      @guild = Guild.find(params[:id])
    end

    def create
      @board = Board.new(guild_params)

      if @board.save
        redirect_to @board
      else
        render 'new'
      end
    end
    #
    # def update
    #   @guild = Guild.find(params[:id])
    #
    #   if @guild.update(guild_params)
    #     redirect_to @guild
    #   else
    #     render 'edit'
    #   end
    # end
    #
    # def destroy
    #   @guild = Guild.find(params[:id])
    #   @guild.destroy
    #
    #   redirect_to guilds_path
    # end
    #
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
