class Applicant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  after_create :update_access_token!, :generate_tasks!

  has_many :tasks, dependent: :destroy

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end

  def generate_tasks!
    20.times do 
      Task.create(applicant: self, text: ::Faker::Lovecraft.sentence, significance: [ :unimportant, :regular, :important ].sample, completed: [true, false].sample )
    end
    
  end

end
