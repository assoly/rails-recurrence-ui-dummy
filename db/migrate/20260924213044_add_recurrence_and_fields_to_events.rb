class AddRecurrenceAndFieldsToEvents < ActiveRecord::Migration[7.1]
  def change
    change_table :events, bulk: true do |t|
      # 1. Для SQLite убираем default с CURRENT_TIMESTAMP и сделаем null: true
      # или укажем дефолт на уровне ActiveRecord/Call-back
      t.datetime :start_at
      t.datetime :end_at

      # 2. Строковая константа 'UTC' разрешена в SQLite
      t.string :time_zone, default: 'UTC', null: false

      # 3. В вашей схеме уже есть recurring_rules типа text, 
      # поэтому добавлять её повторно не нужно. 
      # Если нужно добавить на случай других баз, расскоментируйте с проверкой:
      # t.json :recurring_rules unless column_exists?(:events, :recurring_rules)
    end
  end
end