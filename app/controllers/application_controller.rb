class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

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