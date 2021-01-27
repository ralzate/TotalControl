class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def index
    @people = Person.all
    @people = Person.paginate(page: params[:page], per_page: 10)


    if params[:search].present?
      @search_term = params[:search]
      @people = @people.search_by(@search_term)
      if @people.size.zero?
        redirect_to new_person_path
      end
    end

    # Excel
    @results2 = ActiveRecord::Base.connection.exec_query("SELECT id, name, lastname, phone, email, 
                                                        address, identification, company, user_id, 
                                                        created_at, updated_at from people")
    
    @results2.each do |row|
      puts  row['name'].to_s + " " +  row['name'].to_s + " " + row['lastname'].to_s + " " + row['phone'].to_s+ " " + row['email'].to_s
       + " " + row['address'].to_s+ " " + row['identification'].to_s + " " + row['company'].to_s+ " " + row['person.user.email'].to_s
       + " " + row['created_at'].to_s+ " " + row['updated_at'].to_s
    end

    respond_to do |format|
      format.html
      format.csv { send_data @people.to_csv }
      format.xls 
    end

  end

  def show
  end

  def new
    @person = Person.new
    @person.records.build # Metodo para nested
  end

  def edit
  end

  def create
    #@person = current_user.people.new(person_params)
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :lastname, :phone, :email, :address, :identification, 
      :company, :user_id, records_attributes: [:id, :entrance_temperature, :departure_temperature])
    end
end
