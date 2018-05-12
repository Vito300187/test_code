class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :value
      t.float :price

      t.timestamps
    end
  end
end
