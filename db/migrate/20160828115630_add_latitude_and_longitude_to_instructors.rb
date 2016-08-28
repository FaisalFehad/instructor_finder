class AddLatitudeAndLongitudeToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :latitude, :float
    add_column :instructors, :longitude, :float
  end
end
