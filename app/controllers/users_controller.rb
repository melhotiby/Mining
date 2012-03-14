class UsersController < ApplicationController
  before_filter :admin_user,     only: :destroy
  before_filter :authenticate_user!
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 40)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Successfully Created User"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = current_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in(user, :bypass => true)
      flash[:success] = "User updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
