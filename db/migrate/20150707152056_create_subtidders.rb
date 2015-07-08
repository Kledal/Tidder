class CreateSubtidders < ActiveRecord::Migration
  def change
    create_table :subtidders do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
