class RepositoriesController < ApplicationController
  before_action :get_service

  def index
    @repos_array = @github.get_repos
  end

  def create
    @github.create_repo(params[:name])
    # binding.pry
    redirect_to '/'
  end


    def get_service
      @github = GithubService.new({"access_token" => session[:token]})
    end


end
