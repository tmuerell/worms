module UsersHelper
  def has_role?(role)
    current_user.role == role
  end
end
