class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		t.references :user
  		t.string :content, :limit => 150
  		t.string :title
  		t.timestamps
  	end
  end
end
