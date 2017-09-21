json.array!(@search) do |user|
    json.id user.id
    json.first_name user.first_name
    json.email user.email
end
