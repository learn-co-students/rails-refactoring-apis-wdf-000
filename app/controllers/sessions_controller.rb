class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    git = GithubService.new
    session[:token] = git.authenticate!(ENV['GITHUB_CLIENT'],ENV['GITHUB_SECRET'],params[:code])
    session[:username] = git.get_username
    redirect_to '/'
  end
end