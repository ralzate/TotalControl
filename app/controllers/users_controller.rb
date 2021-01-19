class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update]
  #before_action :authenticate_user! 
  #authorize_resource

  def index
    @users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)


    if params[:search].present?
      @search_term = params[:search]
      @users = @users.search_by(@search_term)
      if @users.size.zero?
        redirect_to new_user_path
      end
    end
  end

  def show
  end

  def new
    @user = User.new
    @user.registries.build # Metodo para nested
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :lastname, :phone, :email, :address, :identification, 
      :company, registries_attributes: [:id, :entrance_temperature, :departure_temperature, :_destroy]
    )
  end
end
