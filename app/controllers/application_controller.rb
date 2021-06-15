class ApplicationController < ActionController::Base
  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest_user@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません！'
    end
  end
end
