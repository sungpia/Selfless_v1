class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.belongs_to :user
			t.belongs_to :charity
			t.string :insta_post_id
      t.timestamps null: false
    end
  end
end
