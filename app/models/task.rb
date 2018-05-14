class Task < ApplicationRecord
  validates :text, presence: true, length: { minimum: 0, maximum: 120 }
end
