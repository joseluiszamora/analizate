default_user = { email: 'admin@analizate.com', password: 'demo123', password_confirmation: 'demo123', username: 'admin', user_type: 'admin', role: 'admin' }
user = User.find_or_create_by_email(default_user)
user.update_attributes(default_user)
puts "User #{user.email} created."