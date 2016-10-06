class AddEmailToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :email, :string
  end
end
