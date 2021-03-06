class SessionsController < ApplicationController
  def new
  if signed_in?
  redirect_to current_user
end
  end

def create
  if params[:session]
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
          flash[:error] = 'Welcome Back' # Not quite right!
          sign_in(user)
          redirect_to :controller => "users", :action => "show", :id => user.id
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  else 
   auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    email = auth_hash["extra"]["raw_info"]["email"]
    usertest = User.find_by_email(email)
    if usertest
      sign_in(usertest)
    else 
      lastid = User.last.id.to_i + 1
      user1= User.new
      user1.id= lastid
      user1.email = email
      user1.password, user1.password_confirmation = SecureRandom.hex(9)
      user1.save(:validate => false)
      sign_in(user1)
    end
    if current_user
      unless @authorization
      auth1 = Authorization.new
      auth1.uid = auth_hash["uid"]
      auth1.provider = auth_hash["provider"]
      auth1.user_id = current_user.id
      auth1.save
      end
    redirect_to :controller => "users", :action => "show", :id => current_user.id
  else
    redirect_to root_path
  end
end
session
end
def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end
def destroy
sign_out()
 redirect_to root_path
end
end
