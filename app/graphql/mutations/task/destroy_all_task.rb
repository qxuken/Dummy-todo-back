class Mutations::Task::DestroyAllTask < Mutations::BaseMutation
  null true

  field :success, Boolean, null: false

  def resolve()
    if ::Task.destroy_all
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
