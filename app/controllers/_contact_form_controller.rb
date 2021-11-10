class ContactFormController < ApplicationController
  def index
    #@contact_form = ContactForm.new()
	@contact_forms = ContactForm.new()
  end
  
  def create
    @contact_form = ContactForm.new()
    @contact_form.name = params[:name]
    @contact_form.email = params[:email]
    @contact_form.message = params[:message]
	respond_to do |format|
	  if @contact_form.deliver
		#render json: {message: "Email sent!"}
	  
		format.html { redirect_to '/about', notice: "Email was successfully sent." }
		format.json { render :show, status: :created, location: '/about' }
		#flash.now[:success] = 'Email was successfully sent.'
	  else
	    render json: @contact_form.errors
	  end
    end
  end
  
  #def new
    #@contact = ContactForm.new
  #end

  #def create
    #@contact = Contact.new()
	#@contact = ContactForm.new(params[:contact_form])
    #@contact.request = request
    #if @contact.deliver
      #render json: {message: "Email sent!"}
    #else
      #render json: @contact.errors
    #end
  #end
end
