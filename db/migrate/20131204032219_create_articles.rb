class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :permalink
      t.text :excerpt
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
