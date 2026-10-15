class AddDurationToWebinar < ActiveRecord::Migration[7.1]
  def change
    add_column :webinars, :duration, :integer
    reversible do |dir|
      dir.up do
        execute("UPDATE webinars SET duration = (strftime('%s', finishes_at) - strftime('%s', starts_at)) WHERE finishes_at IS NOT NULL AND starts_at IS NOT NULL") rescue nil
      end
    end
  end
end
