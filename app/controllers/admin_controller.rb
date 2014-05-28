class AdminController < ApplicationController
  layout "stores"
  def login
		if request.post?
		if params[:admin][:name]=="admin" && params[:admin][:password]=="nimda"
			session[:admin]="admin"
			#flash[:notice]="Welcome Admin"
			redirect_to :controller=>"stores" 
			
		else
			flash[:notice]="Invalid Name/Password"
			render :action=>"login"
		
         end
         end
 end

 def logout
		session[:admin]=nil
		flash[:notice]="Logged out"
		redirect_to :action=>"login"
	end
end
