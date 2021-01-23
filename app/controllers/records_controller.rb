class RecordsController < ApplicationController
  before_action :set_record, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user! 



  def index
    @records = @person.records.all
    @records = Record.paginate(page: params[:page], per_page: 10)


    if params[:search].present?
      @search_term = params[:search]
      @records = @records.search_by(@search_term)
    end
  end

  def show
  end

  def new
    @record = Record.new
  end

  def edit
  end

  def create

    @record = Record.new(record_params)
    @record.person_id = @person.id

    respond_to do |format|
      if @record.save
        format.html { redirect_to person_records_path(@person,@record), notice: 'Registro was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to person_records_path(@person,@record), notice: 'Registro was successfully created.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to person_records_path(@person), notice: 'record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_record
      @person = Person.find(params[:person_id])
      @record = Record.find(params[:id]) if params[:id]    
   end

    def record_params
      params.require(:record).permit(:entrance_temperature, :departure_temperature, :person_id)
    end
end