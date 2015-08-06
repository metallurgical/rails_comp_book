class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password_digest
      t.string :ic
      t.string :phone
      t.string :email
      t.text :address
      t.string :gender

      t.timestamps null: false
    end
  end
end
