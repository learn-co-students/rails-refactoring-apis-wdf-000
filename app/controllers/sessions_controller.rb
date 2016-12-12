class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  # def create
  #   response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"],code: params[:code]}, {'Accept' => 'application/json'}
  #   access_hash = JSON.parse(response.body)
  #   session[:token] = access_hash["access_token"]
  #
  #   user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  #   user_json = JSON.parse(user_response.body)
  #   session[:username] = user_json["login"]
  #
  #   redirect_to '/'
  # end


  def create
    # binding.pry
    github = GithubService.new
    # binding.pry
    session[:token] = github.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    # session[:token] = github.authenticate!(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], params[:code])
    # binding.pry
    session[:username] = github.get_username
    # session[:token] = gith ub.authenticate!(client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET'], code: params[:code])

    redirect_to '/'
  end


  def destroy
    session.clear

    redirect_to '/'
  end


end
