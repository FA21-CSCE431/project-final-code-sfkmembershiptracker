class ContactFormController < ApplicationController
  def index
    @contact_forms = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new
    @contact_form.name = params[:name]
    @contact_form.email = params[:email]
    @contact_form.message = params[:message]
    respond_to do |format|
      if @contact_form.deliver
        format.html { redirect_to '/about', notice: 'Email was successfully sent.' }
        format.json { render :show, status: :created, location: '/about' }
      else
        render json: @contact_form.errors
      end
    end
  end
end
