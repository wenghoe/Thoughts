class AddVisibleFlagToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_column :thoughts, :visible, :boolean, default: true
  end
end
