class CreateRequestBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :request_boxes do |t|
      t.references :user, foreign_key: true
      t.references :message, foreign_key: true
      t.timestamps
    end
  end
end
