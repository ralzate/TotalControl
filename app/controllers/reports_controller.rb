class ReportsController < ApplicationController
  before_action :authenticate_user! 

  def index
    

  end

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
  
end
