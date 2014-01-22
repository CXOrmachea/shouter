class MakeShoutsPolymorphic < ActiveRecord::Migration
  def up
    remove_column :shouts, :body
    add_column :shouts, :content_id, :integer
    add_column :shouts, :content_type, :string
    add_index :shouts, [:content_type, :content_id]
  end

  def down
    add_column :shouts, :body, :string
    remove_column :shouts, :content_id
    remove_column :shouts, :content_type
    remove_index :shouts, column: [:content_type, :content_id]
  end
end
