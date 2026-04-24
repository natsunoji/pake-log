class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :check_maintenance_mode

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録（sign_up）の際に name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    # プロフィール更新（account_update）の際に name を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end

  # プロフィール更新後に設定画面へ戻す
  def after_update_path_for(resource)
    settings_path
  end

  private

  def check_maintenance_mode
    if ENV["MAINTENANCE_MODE"] == "true"
      render file: Rails.root.join("public", "maintenance.html"), layout: false, status: :service_unavailable
    end
  end

  # ログアウト・退会後にトップ画面（LP）へ飛ばす
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
