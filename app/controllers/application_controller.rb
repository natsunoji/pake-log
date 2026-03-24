class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録（sign_up）の際に name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # プロフィール更新（account_update）の際に name を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end

  # 🌟 追加：プロフィール（Account）更新後に設定画面へ戻す
  def after_update_path_for(resource)
    settings_path
  end

  private

  # ログアウト後にログイン画面へ飛ばす
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
