json.extract! member, :id, :full_name, :email, :phone, :role, :grad_date, :points, :created_at, :updated_at
json.url member_url(member, format: :json)
