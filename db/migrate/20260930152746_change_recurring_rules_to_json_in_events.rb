# db/migrate/20260930152746_change_recurring_rules_to_json_in_events.rb
class ChangeRecurringRulesToJsonInEvents < ActiveRecord::Migration[7.1]
  def change
    # copy: :always заставляет SQLite пересоздать таблицу с новым типом колонки
    change_table :events, copy: :always do |t|
      t.change :recurring_rules, :json
    end
  end
end