json.array!(@search) do |user|
    json.id user.id
    json.full_name user.full_name
    json.first_name user.first_name
    json.email user.email
end
