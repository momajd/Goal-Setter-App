class Addsessiontokentouser < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string
    change_column :users, :session_token, :string, null: false, index: true
  end
end
