class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
