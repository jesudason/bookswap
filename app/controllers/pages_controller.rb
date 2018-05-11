class PagesController < ApplicationController

    $book_isbn_arr = "978-1-891830-71-6"

    def index
        @books = Book.all
    end

    def get_book_isbn
        $book_isbn_arr = params[:ids]
        # redirect_to('/api/mapmarkers')
    end

    def map_markers
        search = params[:search]

        current_location = [User.first.latd.to_f , User.first.long.to_f]
        search_radius_in_kms = 5000

        search_results = Book.where(title: search)
                
        @markers = []

        search_results.each do |book|
            book_search_results = []
            book_location = [book.user.latd.to_f, book.user.long.to_f ]
            username = book.user.username
            isbn_number = book.isbn_id
            title = book.title
            description = Faker::Lorem.paragraph

            image = "http://via.placeholder.com/50x50"
            distance_from_me = distance(current_location, book_location).to_i/1000
            
            if distance_from_me < search_radius_in_kms
                book_search_results += [username, book_location[0], book_location[1], image, description, isbn_number, title]
                @markers.push(book_search_results)
            end
        end

        render json: @markers
    end




    def view_map
        render :index
    end



    def distance loc1, loc2
        rad_per_deg = Math::PI/180  # PI / 180
        rkm = 6371                  # Earth radius in kilometers
        rm = rkm * 1000             # Radius in meters
    
        dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
        dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg
    
        lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
        lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }
    
        a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
        c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    
        rm * c # Delta in meters
    end


    def style
    end
    
end