class CreateFollowingRelationships < ActiveRecord::Migration
  def change
    create_table :following_relationships do |t|
      t.references :followed_user
      t.references :follower

      t.timestamps
    end
    add_index :following_relationships, :followed_user_id
    add_index :following_relationships, :follower_id
  end
end
