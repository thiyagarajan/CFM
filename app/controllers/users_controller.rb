class UsersController < ApplicationController

#  before_filter :cache_clear

  def index

    @user = User.all
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to users_path
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_path, :notice => "You have Signed Up successfully Weboniser!!"
    else
      logger.info @user.errors.inspect
      render "new"
    end
  end

end