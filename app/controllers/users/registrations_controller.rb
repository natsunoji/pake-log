class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # 🌟 パスワードなしでプロフィールを更新できるようにする
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      resource.update_without_password(params)
    else
      super
    end
  end

  # 🌟 追記：更新が成功した後のリダイレクト先を指定
  def after_update_path_for(resource)
    settings_path
  end
end
