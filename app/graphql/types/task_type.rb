Types::TaskType = GraphQL::ObjectType.define do
  name "Task"
  field :text, types.String
  field :completed, types.Boolean
end
