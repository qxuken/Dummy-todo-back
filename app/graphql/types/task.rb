module Types
  class Task < BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :position, Integer, null: false
    field :significance, TaskSignificanceEnum, null: false
    field :completed, Boolean, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
