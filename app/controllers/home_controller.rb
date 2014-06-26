class HomeController < ApplicationController
  def index    
  end
  
  def ajax_links
    
    page = params[:page].to_i rescue 1
    
    page = 1 if params.nil? or page < 1
    
    if page == 1
      pagesize = 11 
      
      startpos = 0
    else
      pagesize = 10
      
      startpos = 11 + ((page - 2) * 10)
    end
    
    apps = {}
    
    Application.find(:all, :limit => "#{startpos},#{pagesize}").each do |app|
    
      apps[app.application_name] = [app.url, app.icon_link, app.id]
    
    end
    
    render :json => apps.to_json
    
  end

  def log_app
  
    Frequency.create(:application => params["id"], :client => request.remote_ip) rescue nil
    
    render :text => "Logged!"
  
  end

end
