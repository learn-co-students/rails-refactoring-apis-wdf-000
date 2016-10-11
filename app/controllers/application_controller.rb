class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

    def authenticate_user
      redirect_uri = CGI.escape("http://localhost:8888/auth")
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT']}&scope=repo&redirect_uri=#{redirect_uri}" if !logged_in?
      # redirect_uri = CGI.escape("http://localhost:8888/auth")
      # github_url = "https://github.com/login/oauth/authorize?client_id=#{client_id}&redirect_uri=#{redirect_uri}"
    end

    def logged_in?
      !!session[:token]
    end
end
