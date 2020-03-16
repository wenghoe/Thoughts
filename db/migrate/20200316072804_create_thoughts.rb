class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content,              null: false, default: ""
      t.timestamps
    end
  end
end
