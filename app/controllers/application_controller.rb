class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method %i(left_menu_node upper_menu_node)

  private

  def left_menu_node
    @left_menu_node = [
      { menu_name: 'GuildInfo', link: guilds_path },
      { menu_name: 'Parties', link: guilds_path }
    ]
  end

  def upper_menu_node
    @upper_menu_node = [
      { menu_name: 'One', link: root_path },
      { menu_name: 'Two', link: root_path },
      { menu_name: 'Three', link: root_path },
      { menu_name: 'Four', link: root_path },
      { menu_name: 'Five', link: root_path }
    ]
  end
end
