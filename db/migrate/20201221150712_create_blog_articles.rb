class CreateBlogArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :description
      t.text :content
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
