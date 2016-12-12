class RepositoriesController < ApplicationController
  def index
    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # binding.pry
    # session[:username]
    # session[:token]
    # binding.pry
    github = GithubService.new({"access_token" => session[:token]})
    # github = GithubService.new(session[:token])
    @repos_array = github.get_repos
    # @repos_array = JSON.parse(response.body)
  end

  def create
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}

    # github = GithubService.new
    github = GithubService.new({"access_token" => session[:token]})

    response = github.create_repo(params[:name])
    # session[:token] = github.authenticate!(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], params[:code])
    # response = github.create_repo(params[:name])

    # binding.pry

    redirect_to '/'
  end
end
