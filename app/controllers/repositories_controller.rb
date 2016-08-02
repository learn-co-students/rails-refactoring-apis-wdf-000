class RepositoriesController < ApplicationController
  def index
=begin
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = JSON.parse(response.body)
=end

    @repos_array = GithubService.new({"access_token" => session[:token]}).get_repos
  end

  def create
=begin
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
=end

    GithubService.new({"access_token" => session[:token]}).create_repo(params[:name])

    redirect_to '/'
  end
end
