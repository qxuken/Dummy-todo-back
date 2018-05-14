class Mutations::Task::CreateTask < Mutations::BaseMutation
  null true

  argument :text, String, required: true
  argument :position, Integer, required: false, default_value: nil
  argument :significance, Types::TaskSignificanceEnum, required: false, default_value: nil
  argument :completed, Boolean, required: false, default_value: false

  field :task, Types::Task, null: true
  field :errors, [String], null: false

  def resolve(text:, position:, completed:, significance:)
    task = ::Task.new(text: text, position: position, completed: completed, significance: significance)
    if task.save
      {
        task: task,
        errors: [],
      }
    else
      {
        task: nil,
        errors: task.errors.full_messages
      }
    end
  end
end
