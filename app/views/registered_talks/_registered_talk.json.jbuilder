json.extract! registered_talk, :id, :profile_id, :talk_id, :created_at, :updated_at
json.url registered_talk_url(registered_talk, format: :json)