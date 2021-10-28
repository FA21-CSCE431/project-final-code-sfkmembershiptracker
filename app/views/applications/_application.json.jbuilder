json.extract! application, :id, :first_name, :last_name, :email, :phone, :grad_date, :status, :question, :created_at, :updated_at
json.url application_url(application, format: :json)
