class Task < ApplicationRecord
  before_create :set_position
  before_update :update_positions
  
  validates :text, presence: true, length: { minimum: 0, maximum: 120 }

  enum significance: [ :unimportant, :regular, :important ]

  private

  def set_position
    if self.position 
      Task.where("position >= ?", self.position).map do |t|
        t.update_column(:position, t.position + 1)
      end
    else
      last_position = Task.maximum(:position) || -1
      self.position = last_position + 1
    end
  end

  def update_positions
    if self.position_changed?
      if self.position > self.position_was
        Task.where("position > ? AND position <= ?", self.position_was, self.position).map do |t|
          t.update_column(:position, t.position - 1)
        end
        self.position = Task.where("position > ? AND position <= ?", self.position_was, self.position).maximum(:position) + 1
      else
        Task.where("position >= ? AND position < ?", self.position, self.position_was).map do |t|
          t.update_column(:position, t.position + 1)
        end
        self.position = Task.where("position > ? AND position <= ?", self.position, self.position_was).minimum(:position) - 1
      end
    end
  end
end
