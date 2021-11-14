class Users::SessionsController < Devise::SessionsController
    def after_sign_out_path_for(_resource_or_scope)
      # new_user_session_path
      root_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      if current_user.member.present?
        stored_location_for(resource_or_scope) || root_path
      else
        apply_path
      end
    end
end