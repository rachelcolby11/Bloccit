class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

    default_scope { order('created_at DESC') }

    #An ordered_by_title scope.
    scope :ordered_by_title, -> { reorder('title') }

    #An ordered_by_reverse_created_at scope.
    scope :ordered_by_reverse_created_at, -> { reorder('created_at') }

end
