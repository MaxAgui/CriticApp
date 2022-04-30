class SessionController < ApplicationController
  def new; end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email]) # nil.authenticate(params[:password])

    if user&.authenticate(params[:password]) # false || {instancia user}
      log_in(user)

      redirect_to root_path
    else
      flash.now[:message] = "Email or password invalid"
      render "new", status: :unprocessable_entity
    end
  end

  # DELETE /sessions
  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
