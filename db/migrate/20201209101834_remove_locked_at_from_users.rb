class RemoveLockedAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :locked_at, :datetime
  end
end
