# app/helpers/localized_form_helper.rb
module LocalizedFormHelper
  # 1. Хелпер для считывания атрибута Mobility для текущей локали I18n
  def localized_attr(record, field)
    record.public_send(field, I18n.locale)
  end

  # 2. Хелпер для отрисовки полей в форме (с вкладками Stimulus)
  def translated_fields(form, fields_config, locales: nil)
    locales ||= I18n.available_locales

    content_tag(:div, data: { controller: "tabs" }, class: "app-card mb-6") do
      # Шапка с переключателями языков (Tabs Header)
      tabs_header = content_tag(:div, class: "flex gap-2 border-b border-[var(--app-border-color)] pb-2 mb-4") do
        locales.map.with_index do |locale, idx|
          content_tag(:button, 
            locale.to_s.upcase,
            type: "button",
            data: { 
              action: "click->tabs#select", 
              tabs_target: "tab",
              locale: locale 
            },
            class: "px-3 py-1.5 text-xs font-semibold rounded-lg transition-colors cursor-pointer #{idx.zero? ? 'app-btn-primary' : 'text-[var(--app-text-muted)] hover:bg-[var(--app-bg-nav)]'}"
          )
        end.join.html_safe
      end

      # Содержимое вкладок (Tabs Content)
      tabs_content = locales.map.with_index do |locale, idx|
        content_tag(:div, 
          data: { tabs_target: "panel", locale: locale },
          class: "space-y-4 #{'hidden' unless idx.zero?}"
        ) do
          fields_config.map do |field_name, opts|
            render_translated_input(form, field_name, locale, opts)
          end.join.html_safe
        end
      end.join.html_safe

      tabs_header + tabs_content
    end
  end

  private

  def render_translated_input(form, field_name, locale, opts = {})
    attr = "#{field_name}_#{locale}"
    type = opts[:type] || :text_field
    label_text = opts[:label] || t("common.#{field_name}", default: field_name.to_s.humanize)

    content_tag(:div, class: "space-y-1") do
      label = form.label(attr, "#{label_text} (#{locale.to_s.upcase})", class: "app-label")
      
      input_options = {
        class: "app-input",
        autocomplete: "off"
      }.merge(opts.except(:type, :label))

      input = case type
              when :text_area
                form.text_area(attr, input_options.reverse_merge(rows: 4))
              else
                form.text_field(attr, input_options)
              end

      label + input
    end
  end
end