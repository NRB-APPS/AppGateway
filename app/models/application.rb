class Application < ActiveRecord::Base
	set_table_name "applications"
  set_primary_key "id"

	has_many :user, :foreign_key => 'user_id'
end
