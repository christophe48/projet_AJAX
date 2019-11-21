class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end


  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end



  def new
  end


  def create
  @email = Email.create(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
    if @email.save
      flash[:notice] = "Vous avez reçu un nouvel Email"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {}
      end
    else
      flash[:error] = "Vous n'avez pas reçu de nouvel email!"
      redirect_to :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @email = Email.find(params[:id])
   if @email.destroy
     flash[:notice] = "Vous avez supprimer l'Email"
     respond_to do |format|
       format.html { redirect_to root_path }
       format.js {}
     end
   else
     flash[:error] = "Vous n'avez pas supprimer l'Email"
     render root_path
   end
  end
end
