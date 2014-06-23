class AdminController < ApplicationController

  def index
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
	logged_in(params[:user_id])
	@users = User.find(:all)
  end

  def edit_user
   logged_in(params[:user_id])
   @user = User.find(params[:person]) #rescue []
	if request.post?
		@user.update_attributes(:password => params[:user][:password]) if !params[:user][:password].blank?
		@user.update_attributes(:first_name => params[:user][:first_name]) if !params[:user][:first_name].blank?
		@user.update_attributes(:last_name => params[:user][:last_name]) if !params[:user][:last_name].blank?
		@user.update_attributes(:username => params[:user][:username]) if !params[:user][:username].blank?
		@user.update_attributes(:status => params[:user][:status]) if !params[:user][:status].blank?
		redirect_to "/admin/user_list?user_id=#{params[:user_id]}"
	end
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
	logged_in(params[:user_id])
  end

  def add_user
	logged_in(params[:user_id])
    if request.post?
		#raise params.to_yaml
		#params[:user][:password] = params[:user][:plain_password]
		#params[:user][:plain_password] = nil
		#person = Person.create()
		#person.names.create(params[:person_name])
		#params[:user][:user_id] = nil
		@user = User.new(params[:user])
		@user.save
		redirect_to "/admin/user_list?user_id=#{params[:user_id]}"
	end
  end

  def block_user
	logged_in(params[:user_id])
  end

  def change_role
	logged_in(params[:user_id])
  end
   
  private
	def logged_in(id)
		redirect_to "/admin/index" if id.blank?
	end
end
