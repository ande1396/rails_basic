class UsersController < ApplicationController
  def index
  	@users = User.all
  end
  def new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
  	puts "AAAAAAAAAAAAAAAAA"
  	puts params
  	puts "AAAAAAAAAAAAAAAAA"
  	#command line 
  	@user = User.new(user_params) #will grab below 
  	if @user.save #puts it in db and return true 
  		redirect_to @user, notice: "User was saved" #going to the show page get request on cpomand line, user get :format users#show 
  	else
  		puts "ERRORRRRRRRRRRRRRRRRRRRRRRRR"
  		puts @user.errors.full_messages
  		puts "ERRORRRRRRRRRRRRRRRRRRRRRRRR"
  		redirect_to :back, flash: { errors: @user.errors.full_messages }
      #Setting session errors to errors.full.full_messages, this is just the Rails models for making error messages    
      ############
  	end
  end

  def update
    @user = User.update(params[:id], user_params)
    #user_parms is def below, the params[id], is what one you want to upate, example. users/1
    redirect_to @user
    #@user is on the show page 
  end

  def edit
    @user = User.find(params[:id])
    # find what user you want to edit and set it to user, then go to the edit page. 
  end 

  def destroy
     @user = User.find(params[:id])
     @user.destroy 
     redirect_to users_path
  end 

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  	end
    #######need this explained again as in why we need this. Just a shortcut to reference things, user.first_name params etc. ################ 
end
