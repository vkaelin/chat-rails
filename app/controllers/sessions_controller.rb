class SessionsController < ApplicationController
  def create
    session[:username] = params[:session][:username]
    redirect_to root_path
  end

  def new
  end
end
