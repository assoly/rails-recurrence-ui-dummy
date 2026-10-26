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

            # Защита от падений отдельной записи
            begin
              duration = record.respond_to?(:duration) && record.duration.to_i > 0 ? record.duration : 1.hour.to_i

              # Учитываем таймзону записи для корректного поиска в IceCube
              event_zone = record.respond_to?(:event_time_zone) ? record.event_time_zone : Time.zone
              sched_from = from_time.in_time_zone(event_zone)
              sched_to   = to_time.in_time_zone(event_zone)

              record.schedule.occurrences_between(sched_from, sched_to).each do |occ|
                start_at = occ.to_time
                end_at   = start_at + duration

                title = record.respond_to?(:title) ? record.title : "#{type_name} ##{record.id}"
                record_url = begin; url_for(record); rescue; '#'; end

                events_data << {
                  id: "#{type_name.downcase}_#{record.id}_#{start_at.to_i}",
                  title: title,
                  start: start_at.iso8601,
                  end: end_at.iso8601,
                  backgroundColor: color_code,
                  borderColor: color_code,
                  textColor: "#ffffff",
                  url: record_url
                }
              end
            rescue StandardError => e
              Rails.logger.error("[CalendarController] Error processing #{klass.name} ID #{record.id}: #{e.message}")
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