class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
      t.integer :gender
      t.string :address
      t.text :description
      t.string :auth_token
      t.datetime :confirm_send_at
      t.string :confirm_token
      t.datetime :confirm_at
      t.datetime :reset_send_at
      t.string :reset_token

      t.timestamps
    end
  end
end
