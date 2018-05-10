class PagesController < ApplicationController	
	def home
	end

    def map_markers
        @markers = [['London Eye, London', 51.503454,-0.119562],['Palace of Westminster, London', 51.499633,-0.124755]]
        # @markers = [{
        #     "location_name" : "London Eye",
        #     "country" : "london",
        #     "lat" : 51.503454,
        #     "long": -0.119562
        # },{
        #     "location_name" : "Palace of Westminster",
        #     "country" : "london",
        #     "lat" : 51.499633,
        #     "long": -0.124755
        # }]

        render json: @markers
    end
end
