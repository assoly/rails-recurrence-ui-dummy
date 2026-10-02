class CalendarController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        # FullCalendar передает параметры start и end для видимого диапазона дат
        from_time = params[:start].present? ? Time.zone.parse(params[:start]) : Time.current.beginning_of_month.beginning_of_week
        to_time   = params[:end].present?   ? Time.zone.parse(params[:end])   : Time.current.end_of_month.end_of_week

        events_data = []

        collect_occurrences = lambda do |klass, type_name, color_code|
          next unless defined?(klass)

          klass.find_each do |record|
            next unless record.respond_to?(:schedule) && record.schedule

            # Берем длительность (в секундах) или задаем 1 час по умолчанию
            duration = record.respond_to?(:duration) && record.duration.to_i > 0 ? record.duration : 1.hour.to_i

            record.schedule.occurrences_between(from_time, to_time).each do |occ|
              start_at = occ.to_time
              end_at   = start_at + duration

              events_data << {
                id: "#{type_name.downcase}_#{record.id}_#{start_at.to_i}",
                title: record.title,
                start: start_at.iso8601,
                end: end_at.iso8601,
                backgroundColor: color_code,
                borderColor: color_code,
                textColor: "#ffffff",
                url: url_for(record)
              }
            end
          end
        end

        collect_occurrences.call(Event, 'Event', '#2563eb')     # Синий
        collect_occurrences.call(Task, 'Task', '#059669')       # Зеленый
        collect_occurrences.call(Webinar, 'Webinar', '#9333ea') # Фиолетовый

        render json: events_data
      end
    end
  end
end