class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # 🌟 パスワードなしでプロフィールを更新できるようにする
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      # 🌟 修正ポイント：params から current_password を除外して更新
      resource.update_without_password(params.except(:current_password))
    else
      super
    end
  end

  # 🌟 更新が成功した後のリダイレクト先を指定
  def after_update_path_for(resource)
    settings_path
  end
end
