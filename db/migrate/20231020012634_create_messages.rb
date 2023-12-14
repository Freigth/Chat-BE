# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true
      t.text :body
      t.timestamps
    end

    add_index :messages, %i[user_id chatroom_id]
  end
end
