class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pname
      t.string :pquantity
      t.string :pcolor
      t.string :pprice
      t.string :pno

      t.timestamps null: false
    end
  end
end
