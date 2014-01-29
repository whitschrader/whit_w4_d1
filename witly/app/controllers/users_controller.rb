class UsersController < ApplicationController
 
 def new
    @user = User.new()
  end

 def show
    @user = User.find(params[:id])
  end
  
def create
  signin_params = params.require(:user).permit(:name, :email, :password)
  user = User.find_by_email(signin_params[:email].downcase)

  if user && user.authenticate(signin_params[:password])
          sign_in(user)
    redirect_to(user)
  else
    # create error message and re-render the signin form
    flash[:error] = "Incorrect password & email combo!"
    render :new
  end


  end

  	# @user = User.new(params[:user])
  	# if @user.save
  	# redirect_to root_url, :notice => "Signed up!"
  # 	else
  # 		render "new"  #params.require(session).permit(:name, :email, :password)
  # end
end
