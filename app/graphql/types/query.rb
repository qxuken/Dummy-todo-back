module Types
  class Query < BaseObject
    field :task, [Task], null: true do
      argument :id, Integer, required: false, default_value: nil
    end

    def task(id:)
      if id
        [::Task.find(id)]
      else
        ::Task.all.order(position: :asc)
      end
    end
  end
end
