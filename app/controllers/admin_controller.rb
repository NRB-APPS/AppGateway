class AdminController < ApplicationController

  def index
		@all_app = Application.find(:all, :limit => 6)
		
		@title = "Adminstration"
		@icon = "settings.png"
  end

  def user_list
  end

  def login
		@title = "Adminstration"
		@icon = "settings.png"
		if request.post?
			user = User.check_authenticity(params[:password], params[:username]) #raise params.to_yaml
			#raise user.to_yaml
		end
  end

  def change_password
  end

  def add_user
  end

  def block_user
  end

  def change_role
  end
  
end
