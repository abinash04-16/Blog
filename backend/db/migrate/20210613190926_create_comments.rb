class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id, null: false
      t.integer :blog_id, null: false
      t.string :user_mail, null: false

      t.timestamps
    end
  end
end
