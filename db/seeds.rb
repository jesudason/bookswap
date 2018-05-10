# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require_relative 'ISDN_numbers'

Mybook.delete_all
Wishlist.delete_all
Book.delete_all
User.destroy_all

# require_relative 'ISBN_numbers'

isbn_numbers = File.read(Rails.root.join('db', 'ISBN_numbers.csv')).split(',')
aus_locations = File.read(Rails.root.join('db', 'aus_locations.csv')).split(/\r/)


20.times{
    
    location = aus_locations.sample.split(',')
    new_user = User.new

    new_user.first_name = Faker::Name.first_name
    new_user.last_name = Faker::Name.last_name
    new_user.phone = Faker::PhoneNumber.phone_number
    new_user.email = Faker::Internet.email
    new_user.profile_url = 'https://picsum.photos/100/100'
    new_user.username = Faker::Internet.user_name
    new_user.password_digest =  '$2a$10$TFBAh2DI6KNOomo9sHFTyOjSeKLp.kMWPjkZGl8G7mxdEnMg89iui'
    new_user.address = Faker::Address.street_address
    new_user.suburb = location[3]
    new_user.country = location[1]
    new_user.long = location[6]
    new_user.latd = location[5]
    new_user.save
}


isbn_numbers = File.read(Rails.root.join('db', 'ISBN_numbers.csv')).split(',')


100.times{
    book = Book.new
    book.isbn_id = isbn_numbers.sample.gsub("\r", "").gsub("\n","")
    book.user_id = rand(User.first.id..User.last.id)
    book.save

}

100.times{

    mybook = Mybook.new
    mybook.book_id = rand(Book.first.id..Book.last.id)
    mybook.user_id = rand(User.first.id..User.last.id)
    mybook.borrower_id = rand(User.first.id..User.last.id)
    mybook.save
}

100.times{

    wishlist = Wishlist.new
    wishlist.book_id = rand(Book.first.id..Book.last.id)
    wishlist.user_id = rand(User.first.id..User.last.id)
    wishlist.save
}


def returnState(region)
    state = ""
    case region

    when "1"
        state = "ACT"
    when "2"
        state = "Sydney"
    when "3"
        state = "Northern Territory"
    when "4"
        state = "Queensland"
    when "5 "
        state = "South Australia"
    when "6"
        state = "Tasmania"
    when "7"
        state = "Victoria"
    when "8"
        state = "Western Australia"

    else
      state = "unknown"
    end

    return state
end
