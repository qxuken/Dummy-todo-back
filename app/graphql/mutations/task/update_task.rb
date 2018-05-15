class Mutations::Task::UpdateTask < Mutations::BaseMutation
  null true

  argument :id, ID, required: true
  argument :text, String, required: false, default_value: nil
  argument :position, Integer, required: false, default_value: nil
  argument :significance, Types::TaskSignificanceEnum, required: false, default_value: nil
  argument :completed, Boolean, required: false, default_value: nil

  field :task, Types::Task, null: true
  field :errors, [String], null: false

  def resolve(id:, text:, position:, completed:, significance:)
    task = ::Task.find(id)
    task.text = text if text
    task.position = position if position
    task.completed = completed if completed != nil
    task.significance = significance if significance
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
