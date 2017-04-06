# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
email = 'findfit-admin@gmail.com'

admin = User.where(email: email).first
if admin.blank?
  admin = User.create!(
    :first_name => 'Joe',
    :last_name => 'Admin',
    :email => email,
    :password => 'password'
  )
end
admin.add_role(:admin)

user = User.create!(name: 'Charlie Kiesewetter', password: 'testing123')
#locaiton = Location.create(location: '')
#activity = Activity.create(user: user, location: location)
