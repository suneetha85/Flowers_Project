class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#def current_user
 # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
#end
#Add to cart
   private
  	def current_cart
		Cart.find(session[:cart_id])
	    rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
end
