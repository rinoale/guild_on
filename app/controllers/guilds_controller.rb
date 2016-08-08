class GuildsController < ApplicationController
  def index
    @guilds = Guild.all
  end

  def show
    @guild = Guild.find(params[:id])
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
    params.require(:guild).permit(:guild_master)
  end
end
