json.extract! project, :id, :name, :description, :created_at, :updated_at,
              :user_id, :locality, :region, :postal_code,
              :longitude, :latitude, :street_address
json.url project_url(project, format: :json)
