class CreateThoughtHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :thought_hashtags do |t|
      t.belongs_to :thought, index: true
      t.belongs_to :hashtag, index: true
      t.timestamps
    end
  end
end
