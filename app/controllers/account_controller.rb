class AccountController < ApplicationController	
	def signup
		@user = User.new
		if request.post?
			@user = User.new(params[:user].permit(:name,:email,:hashed_password,:password))
			
			if @user.save
				        UserNotifier.signup_confirmation(@user).deliver

				redirect_to :action=>"login"
				
			else
				render :action=>"signup"
			end
		end
	end
	

	def login
	  	if request.post?
		@user = User.authenticate(params[:user][:email],params[:user][:password])
		if @user
			session[:user]=@user.id
			flash[:notice] = "Welcome #{@user.name}"
			redirect_to :action=>"welcome"
			
		else  
			flash[:notice] = "Invalid Username / Password. Please try again."
		        render :action=>"login"
		    end
		end
	end
	
	def forget_password
		if request.post?
			@user = User.find_by_email(params[:user][:email])
			if @user
			   new_password = random_password
			  
			   @user.update(:password=>new_password)
				UserNotifier.random_password_send(@user,new_password).deliver
				flash[:notice] = "A random password has been sent your email. Please try to login with that password."
			   redirect_to :action=>"login"
			else
			   flash[:notice]="Invalid Email.Please enter correct email"
			   render :action=>"forget_password"
			end		
		end		
	end
	
	def random_password
	   (0...8).map{65.+(rand(25)).chr}.join		
	end
	
	def reset_password
		@user = User.find(session[:user])		
		if request.post?			
			if @user
				@user.update(:password=>params[:user][:password])
				UserNotifier.reset_password_confirmation(@user).deliver
				flash[:notice] = "Your password has been reset sucessfully"
				redirect_to :action=>"welcome"			
			else
				render :action=>"reset_password"				
			end
		end		
	end
	
	def logout
		session[:user]=nil
		session[:cart_id]=nil
		#cookies.delete(:auth_token)
		flash[:notice]="You have Successfully logged out. Hope to see you soon."
		redirect_to :action=>"login"		
	end	
end
