class AddUserIdToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :user_id, :integer
  end
end
