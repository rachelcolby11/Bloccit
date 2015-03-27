class PostPolicy < ApplicationPolicy
  # def index?
  #   true
  # end

  class Scope < Scope

    def resolve
      if user
        if user.admin?
          scope.all
        elsif user.moderator?
          scope.all
        elsif user.member?
          scope.where(post.user == user)
        else
          []
        end
      else
        []
      end
    end
  end

end