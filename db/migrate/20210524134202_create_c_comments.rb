class CreateCComments < ActiveRecord::Migration[6.0]
  def change
    create_table :c_comments do |t|
      t.references :user, foreign_key: true
      t.references :collabo, foreign_key: true
      t.text :text
      t.timestamps
    end
  end
end
