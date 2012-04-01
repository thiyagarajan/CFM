before_filter :cache_clear
  def new

  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      logger.info(session[:user_id])
      redirect_to sessions_path, :notice => "You have successfully Signed In weboniser!!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    logger.info "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

    session[:user_id] = nil
#    reset_session
    logger.info "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    redirect_to new_session_path, :notice => "Signed Out"
  end

end