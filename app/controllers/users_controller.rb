class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end      
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to Shajarah!"
             sign_in(@user)
        format.html { redirect_to @user }
        format.json { render action: 'show', status: :created, location: @user }
      else 
        user1 = User.find_by_email(user_params[:email])
        authent = Authorization.find_by_user_id(user1.id)
        if authent
          flash[:success] = "Welcome Back, You already have an account connected to facebook!"
          user1.password,user1.password_confirmation = user_params[:password]
          user1.save
        format.html { redirect_to "/auth/facebook/" }
        format.json { render action: 'show', location: @user }
        else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.profiles.each do |p|
      p.destroy
    end
    @user.authorizations.each do |a|
      a.destroy
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
