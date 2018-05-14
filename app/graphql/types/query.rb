module Types
  class Query < BaseObject
    field :task, [Task], null: true do
      argument :id, Integer, required: false, default_value: nil
    end
    field :tasksConnection, Task.connection_type, null: true

    def task(id:)
      if id
        [::Task.find(id)]
      else
        ::Task.all.order(position: :asc)
      end
    end
    def tasks_connection
      ::Task.all.order(position: :asc)
    end
  end
end
