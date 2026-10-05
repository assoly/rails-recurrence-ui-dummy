module ApplicationHelper

    # Хелпер для отрисовки поля на всех поддерживаемых локалях
  def translated_field(form, field_name, locales: nil, type: :text_field)
    @locales ||= locales || I18n.available_locales

    @locales.map do |locale|
      attr = "#{field_name}_#{locale}" # напр. title_ru, title_en

      content_tag(:div, class: "my-5") do
        label = form.label(attr, "#{t("common.#{field_name}", default: field_name.to_s.humanize)} (#{locale.to_s.upcase}):")

        input =
          if type == :text_area
            form.text_area(attr, rows: 4,
              class: "block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full",
              autocomplete: "off")
          else
            form.text_field(attr,
              class: "block shadow rounded-md border border-gray-400 outline-none px-3 py-2 mt-2 w-full",
              autocomplete: "off")
          end

        label + input
      end
    end.join.html_safe
  end

  # Хелпер для считывания локализованного значения записи для текущей I18n.locale
  def localized_attr(record, field)
    record.public_send(field, I18n.locale)
  end
end
