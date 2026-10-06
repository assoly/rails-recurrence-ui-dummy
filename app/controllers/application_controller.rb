class ApplicationController < ActionController::Base
  around_action :set_user_time_zone
  around_action :switch_locale

  private

  def set_user_time_zone
    # Берем временную зону из профиля пользователя, либо из параметров URL/дефолта
    user_tz = current_user&.time_zone || params[:time_zone] || Time.zone.name
    
    Time.use_zone(user_tz) { yield }
  end

  # Переключаем локаль для текущего HTTP-запроса
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # Автоматически добавляем ?locale=ru (или /en/) ко всем сгенерированным ссылкам (link_to, url_for)
  def default_url_options
    { locale: I18n.locale }
  end
end