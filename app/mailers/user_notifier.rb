class UserNotifier < ActionMailer::Base
  default from: "from@example.com"
  
    def signup_confirmation(user)
  	@user = user
  	mail(:to => (user.email), :subject => "Welcome to ShoePark")
  end

  def random_password_send(user,password)
  	@user = user
  	@password = password
  	mail(:to => (user.email), :subject => "Your Temproary password...")
  end

  def reset_password_confirmation(user)
    @user = user    
    mail(:to => (user.email), :subject => "Your password has been reset...")
  end

  def purchase_complete(user,cart)
    @user = user
    @cart=cart
    mail(:to => (user.email), :subject => "Your order has been processed!")
  end

end
