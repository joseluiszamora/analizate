default_user = { email: 'admin@analizate.com', password: 'demo123', password_confirmation: 'demo123' }
user = User.find_or_create_by_email(default_user)
puts "User #{user.email} created."
