class DummyTodoSchema < GraphQL::Schema
  query Types::Query
  mutation Types::Mutation
  use GraphQL::Batch
  
  max_depth 10
  max_complexity 300
  default_max_page_size 20

  # # Define hooks as class methods:
  # def self.resolve_type(type, obj, ctx)
  #   # ...
  # end

  # def self.object_from_id(node_id, ctx)
  #   # ...
  # end

  # def self.id_from_object(object, type, ctx)
  #   # ...
  # end
  rescue_from(ActiveRecord::RecordNotFound) { "Not found" }
end
