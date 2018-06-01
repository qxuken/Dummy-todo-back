class Task < ApplicationRecord
  belongs_to :applicant, optional: true 
  is_positionable order: :desc, scope: :applicant
  attr_accessor :new_position

  validates :text, presence: true, length: { minimum: 0, maximum: 120 }

  enum significance: [ :unimportant, :regular, :important ]

  def self.reindex_positions
    Task.all.order(position: :asc).each_with_index.map{|x,i| x.update_column(:position, i)}
  end

  private
  
  def reindex_positions
    Task.reindex_positions
  end
end
