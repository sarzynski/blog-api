class AddArticleToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :article, foreign_key: true
  end
end
