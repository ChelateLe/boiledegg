class CreateCollabos < ActiveRecord::Migration[6.0]
  def change
    create_table :collabos do |t|
      t.references :painter, foreign_key: { to_table: :users }
      t.references :originator, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.string :text
      t.timestamps
    end
  end
end
