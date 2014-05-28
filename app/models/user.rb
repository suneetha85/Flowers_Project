class User < ActiveRecord::Base
	
  attr_accessor :password

  validates :email, uniqueness:  true, length: { in: 5..50 }#, format: { with: /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i/,message: "Only letters allowed" }
  validates :password ,presence: true,confirmation: true, length: {  in: 6..20}
      #, format: { with: /^[([a-z]|[A-Z])0-9_-]$/, message: "must include one number and one letter lower n upper case" }

               


  # To encrypt the password
  	#1. enctypt_new_password (call back)
  	#2. define enctypt (inbuild module)
  	#3. protected mode


  before_save :encrypt_new_password # Encrypting Password

  def self.authenticate(email,password)
    user = find_by_email(email)
    return user if user && user.authenticated_password(password)

  end 

  def authenticated_password(password)
    self.hashed_password == encrypt(password)
  end

  protected #3
  def encrypt_new_password #1
  	return if password.blank?
  	self.hashed_password = encrypt(password)
  end

  def encrypt(string) #2
 	Digest::SHA1.hexdigest(string) #Inbuilt module to enctypt the password
  end

end
