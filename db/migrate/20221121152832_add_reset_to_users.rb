class AddResetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_token, :string
    add_column :users, :reset_token_expires_at, :datetime
  end
end
