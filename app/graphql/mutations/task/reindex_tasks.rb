class Mutations::Task::ReindexTasks < Mutations::BaseMutation
  null true
  
  argument :sure, Boolean, required: true
  field :success, Boolean, null: false

  def resolve(sure:)
    if sure && ::Task.reindex_positions
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
