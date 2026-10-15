# app/helpers/form_errors_helper.rb
module FormErrorsHelper
  # Выводит блок с ошибками валидации формы, используя централизованные переменные темы
  def render_form_errors(resource)
    return unless resource.errors.any?

    content_tag(:div, id: "error_explanation",
                class: "px-4 py-3 font-medium rounded-lg mb-6 border",
                style: "background-color: var(--app-danger-bg); border-color: var(--app-danger-border); color: var(--app-danger-text);") do
      concat(
        content_tag(:h2, class: "text-lg font-semibold mb-2") {
          "#{pluralize(resource.errors.count, t('common.errors.count', default: 'error'))} #{t('messages.errors.prohibited_this_data_from_being_saved', default: 'запретили сохранение этой записи')}"
        }
      )
      concat(
        content_tag(:ul, class: "list-disc list-inside space-y-1 text-sm") do
          resource.errors.full_messages.map do |msg|
            concat content_tag(:li, msg)
          end
        end
      )
    end
  end
end