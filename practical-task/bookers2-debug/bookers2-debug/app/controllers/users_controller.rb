class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    render "edit"
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path
    else
      render "edit"
    end
  end
  
  def follows
    @title = "Follows"
    @user  = User.find(params[:id])
    @users = @user.follows.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.all
    render 'show_follow'
  end
  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        UserMailer.with(to: @user.email, name: @user.name).welcome.deliver_now
        format.html { redirect_to @user, notice: "User was successfully created."
        format.json { render :show, status: :created, location: @user }
      end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
