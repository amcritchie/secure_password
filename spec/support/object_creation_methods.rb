def create_user(overrides = {})
  defaults = {
    username: "newuser",
    email: "newuser@example.com",
    password: "password123",
    password_confirmation: "password123"
  }

  User.create!(defaults.merge(overrides))
end
