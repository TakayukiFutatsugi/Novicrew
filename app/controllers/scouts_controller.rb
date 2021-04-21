class ScoutsController < ApplicationController
  before_action :authenticate_client!, only:[:create]
  before_action :authenticate_user!, only:[:index, :show]
  
  def index
    @scouts = Scout.all.order(id: "DESC")
  end
  
  def show
    @client = Client.find(params[:id])
    @scout = Scout.find_by(client: @client)
    @jobs = Job.where(client: @client)
    @articles = Article.where(client: @client)
  end
  
  def create
    user = User.find(params[:user_id])
    @scout = current_client.scouts.build do |s|
      s.user = user
      s.message = params[:message]
    end
    if @scout.save
      redirect_to root_path
      flash[:notice] = "スカウトを送りました。"
    end  
  end
  
  private
  def scout_params
    params.require(:scout).permit(:user_id, :message)
  end  
end
