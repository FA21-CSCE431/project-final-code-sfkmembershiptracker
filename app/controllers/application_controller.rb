class ApplicationController < ActionController::Base
  def check_member
    if current_user.member.blank?
      redirect_to '/', alert: 'You must be a member of this organization to access this resource.'
    end
  end
end
