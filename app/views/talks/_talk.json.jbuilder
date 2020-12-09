json.extract! talk, :id, :title, :abstract, :conference_id, :created_at, :updated_at
json.url talk_url(talk, format: :json)
