class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.text :recurring_rules

      t.timestamps
    end
  end
end
