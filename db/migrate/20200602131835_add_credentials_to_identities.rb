class AddCredentialsToIdentities < ActiveRecord::Migration[6.0]
  def change
    add_column :identities, :token, :string
    add_column :identities, :refresh_token, :string
  end
end
