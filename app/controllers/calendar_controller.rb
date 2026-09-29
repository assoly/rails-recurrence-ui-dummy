# app/controllers/calendar_controller.rb
require 'ostruct'

class CalendarController < ApplicationController
  def index
    @view_type = params[:view] || 'month'
    
    from_time = Time.current.beginning_of_month.beginning_of_week
    to_time   = Time.current.end_of_month.end_of_week

    raw_events = []

    # Хелпер для сбора повторений любой модели
    collect_occurrences = lambda do |scope, type_name, color_class|
      scope.find_each do |record|
        next unless record.respond_to?(:schedule) && record.schedule

        # Получаем длительность записи в секундах (по умолчанию 1 час, если не задана)
        duration = record.respond_to?(:event_duration) && record.event_duration > 0 ? record.event_duration : 1.hour.to_i

        record.schedule.occurrences_between(from_time, to_time).each do |occ|
          start_time = occ.to_time
          end_time   = start_time + duration

          raw_events << {
            id: record.id,
            title: record.title,
            type: type_name,
            start_at: start_time,
            end_at: end_time,
            record: record,
            color: color_class
          }
        end
      end
    end

    # Собираем данные со всех моделей
    collect_occurrences.call(Event, 'Event', 'bg-blue-600 dark:bg-blue-500 text-white') if defined?(Event)
    collect_occurrences.call(Task, 'Task', 'bg-emerald-600 dark:bg-emerald-500 text-white') if defined?(Task)
    collect_occurrences.call(Webinar, 'Webinar', 'bg-purple-600 dark:bg-purple-500 text-white') if defined?(Webinar)

    # Оборачиваем в OpenStruct для работы с simple_calendar
    @calendar_events = raw_events.map { |e| OpenStruct.new(e) }.sort_by(&:start_at)
  end
end