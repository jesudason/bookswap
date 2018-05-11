console.log('Loading Map Markers')
jQuery(function($) {
    var script = document.createElement('script');
    script.src = "//maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyBTrzql0pdZs-GLtUTuhqjRXjpCRwLU8sk&callback=initialize";

    document.body.appendChild(script);
});

function initialize() {

//     var options =  {
//         url: '/api/mapmarkers?isbn_id=978-1-891830-71-6'
//     }

//     $.ajax(options).done(function(result){
//             renderMap(result)
//     });    
}


function plotMap(search_param){

    // jQuery(function($) {
        // var script = document.createElement('script');
        // script.src = "//maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyBTrzql0pdZs-GLtUTuhqjRXjpCRwLU8sk&callback=initialize";
    
        // document.body.appendChild(script);
    // });

    var options =  {
        // url: '/api/mapmarkers?search=' + search_param
        url: '/api/mapmarkers?search=Matilda'
    }

    console.log(options)

    $.ajax(options).done(function(result){
            renderMap(result)
    });    
    
}

function renderMap(markers){
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
                    
    map = new google.maps.Map(document.querySelector("#map_canvas"), mapOptions);
    map.setTilt(45);

    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });
        
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                var markerContent = infoWindowContent(markers[i])
                infoWindow.setContent(markerContent);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        map.fitBounds(bounds);
    }

    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(14);
        google.maps.event.removeListener(boundsListener);
    });

}

function infoWindowContent(marker){
   
    var content =  
    '<div class="info_content">' +
        '<h3>'+ marker[6] +' (' + marker[0] +')</h3>' +
        '<div class="content_wrapper">' +
            '<img src="'+ marker[3] +'">' +
            '<p class="description">'+ marker[4] + '<br><a href="/books?isbn_id=' + marker[5]+ '">More...</a>' +'</p>' + 
        '</div>' +
        '<div class="btn_wrapper">' +
            '<button class="maps_btn">Borrow</button>' + 
            '<button class="maps_btn">Wishlist</button>' + 
        '</div>' +


    '</div>'

    return content
}
