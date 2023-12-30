json.extract! @experience, :id, :name, :description, :price, :category, :address
json.host do
  json.first_name @experience.host.first_name
  json.last_name @experience.host.last_name
  json.phone_number @experience.host.phone_number
end
json.reviews @experience.reviews do |review|
  json.extract! review, :id, :content
  json.user do
    json.first_name review.user.first_name
    json.last_name review.user.last_name
  end
end
