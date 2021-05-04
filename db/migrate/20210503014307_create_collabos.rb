class CreateCollabos < ActiveRecord::Migration[6.0]
  def change
    create_table :collabos do |t|
      t.string :title, null:false
      t.string :text
      t.timestamps
    end
  end
end
