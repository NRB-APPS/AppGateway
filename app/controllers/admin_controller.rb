class AdminController < ApplicationController

  def index
		@all_app = Application.find(:all, :limit => 6)
		
		@title = "Adminstration"
		@icon = "settings.png"
  end

  def user_list
	@user = User.find(:all)
  end

  def login
		@title = "Adminstration"
		@icon = "settings.png"
		if request.post?
			user = User.authenticite(params[:username], params[:password]) #raise params.to_yaml
			#raise user.to_yaml
		end
  end

  def change_password
  end

  def add_user
    if request.post?
		#raise params.to_yaml
		#params[:user][:password] = params[:user][:plain_password]
		#params[:user][:plain_password] = nil
		#person = Person.create()
		#person.names.create(params[:person_name])
		#params[:user][:user_id] = nil
		@user = User.new(params[:user])
		@user.save
	end
  end

  def block_user
  end

  def change_role
  end
  
end
