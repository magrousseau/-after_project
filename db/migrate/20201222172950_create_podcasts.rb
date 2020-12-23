class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :link
      t.date :date

      t.timestamps
    end
  end
end
