class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :client, foreign_key: true, null: false
      t.string :title
      t.integer :genre
      t.timestamps
    end
  end
end
