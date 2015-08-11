class CreatePrivates < ActiveRecord::Migration
  def change
    create_table :privates do |t|
      t.string :username
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
