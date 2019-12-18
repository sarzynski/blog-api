class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :status, :publish_date, :author, :categories

  def author
    { author_id: self.object.user.id,
      author_email: self.object.user.email }
  end

  def categories
   self.object.categories.map do |category|
     { id: category.id,
       title: category.title }
   end
  end
end
