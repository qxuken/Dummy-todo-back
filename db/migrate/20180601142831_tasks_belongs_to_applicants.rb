class TasksBelongsToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tasks, :applicant)
  end
end
