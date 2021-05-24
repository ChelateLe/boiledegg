class CreateCLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :c_likes do |t|
      t.references :user, foreign_key: true
      t.references :collabo, foreign_key: true
      t.timestamps
    end
  end
end
