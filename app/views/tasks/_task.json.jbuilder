json.extract! task, :id, :title, :completed, :due_date, :recurrence_data, :created_at, :updated_at
json.url task_url(task, format: :json)
