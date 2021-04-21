class ClientsController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show]
  before_action :authenticate_client!, only:[:home]
  
  def index
    @clients = Client.all.order(id: "DESC")
  end
  
  def show
    @client = Client.find(params[:id])
    @jobs = Job.where(client: @client)
    @articles = Article.where(client: @client)
  end
  
  def home
    @client = current_client
    @jobs = Job.where(client: current_client)
    @articles = Article.where(client: current_client)
  end  
end
