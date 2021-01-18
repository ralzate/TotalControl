class RegistriesController < ApplicationController
  before_action :set_registry, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  #before_action :authenticate_user! 



  def index
    @registries = @user.registries.all
  end

  def show
  end

  def new
    @registry = Registry.new
  end

  def edit
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.user_id = @user.id

    respond_to do |format|
      if @registry.save
        format.html { redirect_to user_registries_path(@user,@registry), notice: 'Registro was successfully created.' }
        format.json { render :show, status: :created, location: @registry }
      else
        format.html { render :new }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to user_registries_path(@user,@registry), notice: 'Registro was successfully created.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to registries_url, notice: 'Registry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_registry
      @user = User.find(params[:user_id])
      @registry = Registry.find(params[:id]) if params[:id]    
   end

    def registry_params
      params.require(:registry).permit(:entrance_temperature, :departure_temperature, :user_id)
    end
end
