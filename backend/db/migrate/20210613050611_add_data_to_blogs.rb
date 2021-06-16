class AddDataToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :maincontent, :text
    add_column :blogs, :content1, :text
    add_column :blogs, :content2, :text
    add_column :blogs, :user_mail, :string
  end
end
