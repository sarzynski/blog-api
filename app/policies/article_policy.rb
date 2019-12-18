class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def article
    record
  end

  def is_owner
    user.present? && user == article.user
  end
end

# index tak by zwracane byly artkuly osoby ktora go stworzyla
