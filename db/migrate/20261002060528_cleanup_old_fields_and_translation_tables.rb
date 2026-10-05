class CleanupOldFieldsAndTranslationTables < ActiveRecord::Migration[7.1]
  def change
    # 1. Удаляем ранее созданные таблицы переводов (если вы создавали их через g mobility:translations)
    drop_table :event_translations, if_exists: true
    drop_table :task_translations, if_exists: true
    drop_table :webinar_translations, if_exists: true

    # Или если вы генерировали глобальные таблицы key_value (mobility_install):
    drop_table :mobility_string_translations, if_exists: true
    drop_table :mobility_text_translations, if_exists: true

    # 2. Удаляем оригинальные колонки title и description из основных таблиц
    remove_column :events, :title, :string, if_exists: true
    remove_column :events, :description, :text, if_exists: true

    remove_column :tasks, :title, :string, if_exists: true
    remove_column :tasks, :description, :text, if_exists: true

    remove_column :webinars, :title, :string, if_exists: true
    remove_column :webinars, :description, :text, if_exists: true

    # 3. Добавляем единую jsonb-колонку translations для бэкенда :container (если PostgreSQL)
    # add_column :events,   :translations, :jsonb, default: {}
    # add_column :tasks,    :translations, :jsonb, default: {}
    # add_column :webinars, :translations, :jsonb, default: {}

    # ПРИМЕЧАНИЕ: Если у вас SQLite (как в проекте с recurrence_ui), 
    # замените :jsonb на :json:
     add_column :events,   :translations, :json, default: {}
     add_column :tasks,    :translations, :json, default: {}
     add_column :webinars, :translations, :json, default: {}
  end
end
