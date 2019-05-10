class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :content

      t.timestamps null: false
    end
  end
end
