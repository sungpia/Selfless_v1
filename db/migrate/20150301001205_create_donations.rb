class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
			t.belongs_to :post
			t.integer :amount
			t.string :insta_id
			t.string :host_insta_id
			t.string :insta_comment_id
      t.timestamps null: false
    end
  end
end
