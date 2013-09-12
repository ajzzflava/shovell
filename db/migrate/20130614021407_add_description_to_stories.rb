class AddDescriptionToStories < ActiveRecord::Migration
  def change
    add_column :stories, :description, :text
  end

  def self.down
    remove_column :stories, :description
  end
end
