class AdminController < ApplicationController

  def index
		#raise params.to_yaml
		if params[:user_id].blank?
			redirect_to "/admin/login" and return
		else
			@user = User.find(params[:user_id]) rescue []
			redirect_to "/admin/login" and return if @user.blank?
			@all_app = Application.find(:all, :limit => 6)	
			@title = "Adminstration"
			@icon = "settings.png"
		end
  end

  def user_list
	@users = User.find(:all)
  end

  def login
		@title = "Adminstration"
		@icon = "settings.png"
		if request.post?
			user = User.authenticate(params[:username], params[:password]) 
			if !user.blank?
			redirect_to "/admin/index?user_id=#{user.id}"
			end
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
		redirect_to "/admin/user_list"
	end
  end

  def block_user
  end

  def change_role
  end
  
end
