# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


email1 = 'findfit-admin@gmail.com'
email2 = 'f.andrew.carroll@gmail.com'
email3 = 'panda@gmail.com'
email4 = 'parrot@gmail.com'

admin = User.where(email: email1).first
if admin.blank?
  admin = User.create!({
    first_name: 'Joe',
    last_name: 'Admin',
    email: email1,
    password: 'password'
  })
end
admin.add_role :admin

user1 = User.create!({
    :first_name => 'Andrew',
    :last_name => 'Ninja',
    :email => email2,
    :password => 'password'
  })
user1.add_role(:user)

user2 = User.create!({
    :first_name => 'Poppy',
    :last_name => 'Panda',
    :email => email3,
    :password => 'password'
  })
user2.add_role(:user)

user3 = User.create!({
    :first_name => 'Pete',
    :last_name => 'Parrot',
    :email => email4,
    :password => 'password'
  })
user3.add_role(:user)

location1 = Location.create!({
    :name => 'Embarcadero Marina Park South',
    :address => '200 Marina Park Way',
    :city => 'San Diego',
    :state => 'CA',
    :zip => '92101'
  })
activity1 = Activity.create!({
    :name => 'Drunk Dunks',
    :user_id => 2,
    :website => 'www.drunkdunks.com',
    :description => 'Get drunk and have a slam dunk contest',
    :next_at => DateTime.strptime("04/28/2017 17:00:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 1,
    :schedule => 'Fridays at 5pm',
    :requirement => 'BYOB and be ready to ball!',
    :fitness_level => 'All Levels Welcome',
    :pricing => 'Free'
  })

location2 = Location.create!({
    :name => 'Glorietta Bay Park',
    :address => '1975 Strand Way',
    :city => 'Coronado',
    :state => 'CA',
    :zip => '92118'
  })
activity2 = Activity.create!({
    :name => 'Sunrise Bootcamp',
    :user_id => 3,
    :website => 'www.sunrisebootcamp.com',
    :description => 'Start your day off with a purpose. Navy Seal led fitness bootcamp next to where Navy Seals are made. Do you have what it takes?',
    :next_at => DateTime.strptime("05/02/2017 06:00:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 2,
    :schedule => 'Tuesdays & Thursdays at 6am',
    :requirement => 'Bring your body and Carpe Diem',
    :fitness_level => 'Advanced',
    :pricing => '$5.00'
  })

location3 = Location.create!({
    :name => 'Cuvier Park',
    :address => '590 Coast Blvd S',
    :city => 'La Jolla',
    :state => 'CA',
    :zip => '92037'
  })
activity3 = Activity.create!({
    :name => 'Sunset Yoga',
    :user_id => 4,
    :website => 'www.sunsetyoga.com',
    :description => 'Peaceful day to end your Sunday and help start your week off right.',
    :next_at => DateTime.strptime("04/30/2017 19:00:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 3,
    :schedule => 'Sundays at 7pm',
    :requirement => 'Yoga mat',
    :fitness_level => 'Beginner',
    :pricing => '$10.00'
  })

location4 = Location.create!({
    :name => 'Torrey Pines State Reserve',
    :address => '12600 N Torrey Pines Rd',
    :city => 'La Jolla',
    :state => 'CA',
    :zip => '92037'
  })
activity4 = Activity.create!({
    :name => 'Hike Torrey Pines',
    :user_id => 2,
    :website => 'www.hiketorrey.com',
    :description => 'Start your weekend off right with a morning hike at Torrey Pines State Reserve. The group meets up in the South Beach Lot.',
    :next_at => DateTime.strptime("05/17/2017 10:00:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 4,
    :schedule => 'Third Thursday of each month at 10am',
    :requirement => 'Comfortable shoes for hiking.',
    :fitness_level => 'All Levels Welcome',
    :pricing => 'Free'
  })

location5 = Location.create!({
    :name => 'Mission Trails Regional Park',
    :address => '1 Father Junipero Serra Trail',
    :city => 'San Diego',
    :state => 'CA',
    :zip => '92119'
  })
activity5 = Activity.create!({
    :name => 'Mountain Biking',
    :user_id => 3,
    :website => 'www.mtnbike4lyfe.com',
    :description => 'Come join us as we shred up Mission Trails.',
    :next_at => DateTime.strptime("04/29/2017 12:00:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 5,
    :schedule => 'Saturdays at noon',
    :requirement => 'Mountain Bike, Water, and Snacks',
    :fitness_level => 'Intermediate',
    :pricing => 'Free'
  })

location6 = Location.create!({
    :name => 'Mission Bay Park',
    :address => '2688 East Mission Bay Drive,',
    :city => 'San Diego',
    :state => 'CA',
    :zip => '92109'
  })
activity6 = Activity.create!({
    :name => 'Cali Calisthenics',
    :user_id => 4,
    :website => 'www.calical.com',
    :description => 'Join the rave! Learn how to master your body and get the best workout and physique of your life!',
    :next_at => DateTime.strptime("04/27/2017 17:30:00", "%m/%d/%Y %H:%M:%S"),
    :location_id => 6,
    :schedule => 'Tue-Thu-Sat at 5:30pm',
    :requirement => 'Water',
    :fitness_level => 'All Levels Welcome',
    :pricing => '$15.00'
  })
#locaiton = Location.create(location: '')
#activity = Activity.create(user: user, location: location)
