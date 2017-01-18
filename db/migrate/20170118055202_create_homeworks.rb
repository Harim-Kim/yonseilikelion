class CreateHomeworks < ActiveRecord::Migration[5.0]
  def change
    create_table :homeworks do |t|

      t.timestamps null: false
      t.text :title
      t.text :content
      t.integer :user_id
      t.string :img_url
      t.integer :homework_num
      t.string :c9_url
      t.string :as_type
      t.string :spare1
      t.integer :spare2
    end
  end
end
