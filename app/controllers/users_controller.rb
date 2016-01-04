class UsersController < ApplicationController
   before_action :set_type
  def index
    @users = type_class.all
    set_type
    ip = request.remote_ip
    @lat = Geocoder.search(ip)[0].latitude
    @lng = Geocoder.search(ip)[0].longitude
  end

  def show
    @user = User.find(params[:id])
    @nearby = @user.nearbys
  end
  def new
    @user = type_class.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  private
  
  def set_type
    @type = type
  end
  def type
    if params[:type] == "OwnerUser" || params[:type] == "SellerUser"
      params[:type]
    else
      "ShovelUser"
    end
  end
  def type_class
    type.constantize
  end
  
  def user_params
    params.require(:user).permit(:username, :address, :description, :price, :password, :password_confirmation)
  end
end
