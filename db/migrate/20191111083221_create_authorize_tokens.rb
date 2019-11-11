class CreateAuthorizeTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :authorize_tokens do |t|
      t.string :token, index: true
      t.string :name
    end

    add_reference :links, :authorize_token
  end
end
