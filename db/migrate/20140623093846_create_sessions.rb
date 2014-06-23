class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.primary :id
      t.string :session_id
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
