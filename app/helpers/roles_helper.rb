module RolesHelper
  # nested_start
  def role_options()
    Role.all.pluck('info, id')
  end
  # nested_finish
end
