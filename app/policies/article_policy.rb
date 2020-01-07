class ArticlePolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: article.user)
      end
    end

    private

    attr_reader :user, :scope
  end

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
