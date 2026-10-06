# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_user_time_zone
  around_action :switch_locale


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:time_zone])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:time_zone])
  end

  private

  def set_user_time_zone
    user_tz = try(:current_user)&.try(:time_zone) || params[:time_zone] || Time.zone.name
    Time.use_zone(user_tz) { yield }
  end
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # Автоматически добавляем ?locale=ru (или /en/) ко всем сгенерированным ссылкам (link_to, url_for)
  def default_url_options
    { locale: I18n.locale }
  end
end