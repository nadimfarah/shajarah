class SessionsController < ApplicationController
  def new
  end

def create
  auth_hash = request.env['omniauth.auth']
 
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  if @authorization.user_id
    render  :text => @authorization.user_id

  else
 user1= User.new
 @authorization.user_id =user1.id
      if user1
       render :text=> user1.id
     else 
      render :text => "id=nill" 
      end
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
