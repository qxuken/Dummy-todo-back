class Task < ApplicationRecord
  belongs_to :applicant, optional: true 
  is_positionable scope: :applicant

  attr_accessor :new_position
  after_save :change_position

  validates :text, presence: true, length: { minimum: 0, maximum: 120 }

  enum significance: [ :unimportant, :regular, :important ]

  def self.reindex_positions
    Task.all.order(position: :asc).each_with_index.map{|x,i| x.update_column(:position, i)}
  end

  private
  
  def change_position
    if self.new_position
      self.move_to(self.new_position)
    end
  end
  
  def reindex_positions
    Task.reindex_positions
  end
end
