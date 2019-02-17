class CreateCommetms < ActiveRecord::Migration[5.0]
  def change
    create_table :commetms do |t|
      t.integer :user_id
      t.integer :microposts_id
      t.text :body

      t.timestamps
    end
  end
end
