class Types::Mutation < Types::BaseObject
  field :create_task, mutation: Mutations::Task::CreateTask
  field :update_task, mutation: Mutations::Task::UpdateTask
  field :destroy_task, mutation: Mutations::Task::DestroyTask
  field :destroy_all_task, mutation: Mutations::Task::DestroyAllTask
  field :reindex_tasks, mutation: Mutations::Task::ReindexTasks
end
