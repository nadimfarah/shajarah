class SessionsController < ApplicationController
  def new
  end

def create
  auth_hash = request.env['omniauth.auth']
 
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])


 lastid = User.last.id.to_i + 1
 user1= User.create(:id => lastid )
 @authorization.user_id = user1.id

   redirect_to :controller => "users", :action => "show", :id =>  @authorization.user_id
end
def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end
  def destroy
  session[:user_id] = nil
  render :text => "You've logged out!"
end
end
