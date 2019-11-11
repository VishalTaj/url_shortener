class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :shorten_hash
      t.string :title
      t.string :description
      t.boolean :active, default: true
      t.datetime :expires_on

      t.timestamps
    end
  end
end
