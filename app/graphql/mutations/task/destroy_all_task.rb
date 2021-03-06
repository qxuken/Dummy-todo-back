class Mutations::Task::DestroyAllTask < Mutations::BaseMutation
  null true

  argument :sure, Boolean, required: true
  field :success, Boolean, null: false

  def resolve(sure:)
    if sure && ::Task.destroy_all
      {
        success: true
      }
    else
      {
        success: false
      }
    end
  end
end
