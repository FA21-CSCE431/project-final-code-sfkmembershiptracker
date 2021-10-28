json.extract! payment, :id, :member_id, :date, :amount, :description, :created_at, :updated_at
json.url payment_url(payment, format: :json)
