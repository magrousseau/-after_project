class AddColumnsToPodcasts < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :small_description, :text
    add_column :podcasts, :podcast_number, :integer
  end
end
