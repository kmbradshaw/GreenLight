class CreateRedlights < ActiveRecord::Migration[5.0]
  def change
    create_table :redlights do |t|
      t.integer :user_id, null: false
      t.text    :problems

      t.timestamps null: false
  	end
  end
end
