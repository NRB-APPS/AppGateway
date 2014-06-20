class CreateUsages < ActiveRecord::Migration
  def self.up
    create_table :usages do |t|
      t.primary :usage_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :usages
  end
end
