class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string  :name
      t.string  :car
      t.text    :address
      t.boolean :manual
      t.boolean :auto

      t.timestamps
    end
  end
end
