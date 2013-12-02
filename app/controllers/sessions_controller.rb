class SessionsController < ApplicationController
  def new
  end

def create
  auth_hash = request.env['omniauth.auth']
  if session[:uid]
    # Means our user is signed in. Add the authorization to the user
    User.find(session[:uid]).add_provider(auth_hash)
    render :text => "You can now login using #{auth_hash["provider"].capitalize} too!"
  else
    # Log him in or sign him up
    # Create the session
    session[:user_id] = 1
 
    render :text => "Welcome #{auth.user.name}!"
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
