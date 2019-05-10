class CreateApiV1Tasks < ActiveRecord::Migration
  def change
    create_table :api_v1_tasks do |t|
      t.string :status
      t.string :content

      t.timestamps null: false
    end
  end
end
