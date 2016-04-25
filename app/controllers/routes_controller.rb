class RoutesController < ApplicationController
  before_action :set_routes
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  # GET users/1/routes
  def index
    @routes = @user.routes
  end

  # GET users/1/routes/1
  def show
  end

  # GET users/1/routes/new
  def new
    @route = @user.routes.build
  end

  # GET users/1/routes/1/edit
  def edit
  end

  # POST users/1/routes
  def create
    @route = @user.routes.build(route_params)

    if @route.save
      redirect_to([@route.user, @route], notice: 'Route was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/routes/1
  def update
    if @route.update_attributes(route_params)
      redirect_to([@route.user, @route], notice: 'Route was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/routes/1
  def destroy
    @route.destroy

    redirect_to user_routes_url(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routes
      @user = User.find(params[:user_id])
    end

    def set_route
      @route = @user.routes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def route_params
      params.require(:route).permit(:distance, :starting_lat, :starting_lng, :name)
    end
end
