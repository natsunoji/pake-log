class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # 🌟 パスワードなしでプロフィールを更新できるようにする
  def update_resource(resource, params)
    # パスワード関連がすべて空の場合
    if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      # 🌟 修正：params から current_password を除外して更新する
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