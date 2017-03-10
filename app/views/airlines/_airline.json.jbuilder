json.extract! airline, :id, :name, :iata, :phone_no, :contact_link, :pet_info_link, :comments, :created_at, :updated_at
json.url airline_url(airline, format: :json)
