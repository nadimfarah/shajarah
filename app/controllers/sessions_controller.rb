class SessionsController < ApplicationController
  def new
  end

def create
  auth_hash = request.env['omniauth.auth']
 
  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  email = auth_hash["extra"]["raw_info"]["email"]
  if (User.find_by_email(email).exists?){ 
    user = User.find_by_email(email)
    @authorization.user_id = user.id}
  else {
 lastid = User.last.id.to_i + 1
 user1= User.new
 user1.id= lastid
 user1.email = email
 user1.save(:validate => false)
 @authorization.user_id = user1.id}



   redirect_to :controller => "users", :action => "show", :id => user1.id
end
def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end
  def destroy
  session[:user_id] = nil
  render :text => "You've logged out!"
end
end
