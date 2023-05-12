module UsersHelper
  def devise_logout_path
    logout_path(resource_name)
  end
end
