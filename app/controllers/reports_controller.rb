class ReportsController < ApplicationController
  before_action :authenticate_user! 

  def index
  end


  # Reporte de usuarios
  # Pdf
  def users_pdf
    @users = User.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "users.html.erb",
        template: "users.html.erb"
      end
     end
  end
  # Xls
  def users_xls
    @results = User.all
        respond_to do |format|
      format.html
      format.csv { send_data User.to_csv }
      format.xls do
        render xls: "users.xls.erb",
        template: "users.xls.erb"
      end
    end
  end


  
  # Reporte de personas
  # Pdf
  def people_pdf
    @people = Person.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "people.html.erb",
        template: "people.html.erb"
      end
     end
  end
  # Xls
  def people_xls
    @results2 = Person.all
    respond_to do |format|
      format.csv { send_data Person.to_csv }
      format.xls do
        render xls: "people.xls.erb",
        template: "people.xls.erb"
      end
    end
  end



  # Reporte de movimientos
  # Pdf
  def records_pdf
    @records = Record.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "records.html.erb",
        template: "records.html.erb"
      end
     end
  end

  # Xls
  def records_xls
    @results3 = Record.all
    respond_to do |format|
      format.csv { send_data Record.to_csv }
      format.xls do
        render xls: "records.xls.erb",
        template: "records.xls.erb"
      end
    end
  end



end
