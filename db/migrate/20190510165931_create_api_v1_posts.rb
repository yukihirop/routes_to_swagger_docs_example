class CreateApiV1Posts < ActiveRecord::Migration
  def change
    create_table :api_v1_posts do |t|
      t.string :status
      t.string :content

      t.timestamps null: false
    end
  end
end
