class SessionsController < ApplicationController
  def new
  end

def create

  redirect_to current_user

end
def failure
  render :text => "Sorry, but you didn't allow access to our app!"
end
def destroy
sign_out()
 redirect_to root_path
end
end
