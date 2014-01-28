module Concerns
  module Following
    extend ActiveSupport::Concern

    included do
      has_many :follower_relationships,
      foreign_key: :followed_user_id,
      class_name: 'FollowingRelationship'
      has_many :followers, through: :follower_relationships

      has_many :followed_user_relationships,
      foreign_key: :follower_id,
      class_name: 'FollowingRelationship'
      has_many :followed_users, through: :followed_user_relationships
    end

    def following?(user)
      followed_user_ids.include? user.id
    end

    def follow user
      followed_users << user
    end

    def unfollow user
      followed_users.delete(user)
    end

    def followed_user_shouts
      Shout.where(user_id: followed_user_ids)
    end

  end
end