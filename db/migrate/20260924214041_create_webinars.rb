class CreateWebinars < ActiveRecord::Migration[7.1]
  def change
    create_table :webinars do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :finishes_at
      t.string :time_zone_name
      t.json :schedule_json

      t.timestamps
    end
  end
end
