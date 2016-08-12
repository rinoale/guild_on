class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method %i(left_menu_node upper_menu_node current_user)

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/login' unless current_user
  end

  private

  def left_menu_node
    @left_menu_node = [
      { menu_name: 'Guilds', link: guilds_path },
      { menu_name: 'Parties', link: guilds_path }
    ]
  end

  def upper_menu_node
    @upper_menu_node = [
      { menu_name: 'Introduce', link: root_path },
      { menu_name: 'Guilds', link: guilds_path },
      { menu_name: 'Free BBS', link: root_path },
      { menu_name: 'Gallery', link: root_path },
      { menu_name: 'QnA', link: root_path }
    ]
  end
end
