class Mutations::Task::DestroyTask < Mutations::BaseMutation
  null true

  argument :id, ID, required: true

  field :success, Boolean, null: false

  def resolve(id:)
    task = ::Task.find(id)
    if task.destroy
      {
        success: true,
      }
    else
      {
        success: false,
      }
    end
  end
end
