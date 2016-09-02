class ChangeUserIdToInstructorIdInRequests < ActiveRecord::Migration[5.0]
  def change
    rename_column :requests, :user_id, :instructor_id
  end
end
