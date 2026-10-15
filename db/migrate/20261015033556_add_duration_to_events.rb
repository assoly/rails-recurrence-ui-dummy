class AddDurationToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :duration, :integer
  
    reversible do |dir|
      dir.up do
        execute("UPDATE events SET duration = (strftime('%s', end_at) - strftime('%s', start_at)) WHERE end_at IS NOT NULL AND start_at IS NOT NULL") rescue nil
      end
    end
  end
end
