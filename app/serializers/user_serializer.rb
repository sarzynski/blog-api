class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :articles

  def articles
    self.object.articles.map do |article|
      { title: article.title,
        description: article.description,
        image: article.image,
        status: article.status,
        publish_date: article.publish_date }
    end
  end
end
