class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method %i(left_menu_node upper_menu_node)

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
      { menu_name: 'FreeBoard', link: root_path },
      { menu_name: 'Gallery', link: root_path },
      { menu_name: 'QnA', link: root_path }
    ]
  end
end
