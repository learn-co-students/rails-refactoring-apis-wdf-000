class RepositoriesController < ApplicationController
  def index
    @repos_array = GithubService.new({"access_token" => session[:token]}).get_repos
  end

  def create
    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    GithubService.new({"access_token" => session[:token]}).create_repo(params[:name])
    redirect_to '/'
  end
end
