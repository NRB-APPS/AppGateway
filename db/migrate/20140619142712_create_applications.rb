class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.primary :application_id
      t.string :application_name
      t.string :url
      t.string :icon_link

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
