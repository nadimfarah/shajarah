class SessionsController < ApplicationController
  def new
  end

def create
  auth_hash = request.env['omniauth.auth']
 
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization.user_id
    redirect_to :controller=>'Users_controller', :action => 'show', :id => @authorization.user_id
  else
 user= User.create
 @authorization.user_id =user.id
    redirect_to :controller=>'Users_controller', :action => 'show', :id => @authorization.user_id
  end
end
def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end
  def destroy
  session[:user_id] = nil
  render :text => "You've logged out!"
end
end
