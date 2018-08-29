class UpdateArticleCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :category, :string
    add_column :articles, :summary, :string
  end
end
