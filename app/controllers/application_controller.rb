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

  private

  # ログアウト後にログイン画面へ飛ばす
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
