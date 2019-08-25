json.extract! project, :id, :name, :description, :created_at, :updated_at,
              :user_id, :locality, :region, :postal_code,
              :longitude, :latitude, :street_address, :avatar
json.url url_for(:avatar)
json.url project_url(project, format: :json)
