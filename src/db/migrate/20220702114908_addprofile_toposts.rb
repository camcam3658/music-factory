class AddprofileToposts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :profile, :string
  end
end
