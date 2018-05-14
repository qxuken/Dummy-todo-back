Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :Task do
    type Types::TaskType
    argument :id, !types.ID
    description "Find a Task by ID"
    resolve ->(obj, args, ctx) { Task.find(args["id"]) }
  end
end
