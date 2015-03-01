class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
			t.string :os_type
			t.string :insta_id
			t.string :insta_name
			t.string :push_id
			t.string :credit_number
			t.string :credit_cvv
			t.string :credit_month
			t.string :credit_year
			t.integer :default_charity_id, default: 1
      t.timestamps null: false
    end
  end
end
