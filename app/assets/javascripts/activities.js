var infoWindow;
var map;
var activityId;
// Create the map when the page loads
$(document).on('ready', loadAndCreateGmap);

function loadAndCreateGmap() {
  // Only load map data if activity map is on the page
  if ($('#activity_map').length > 0 ){
    // Access the data-activity-id attribute on the map element
    activityId = $('#activity_map').attr('data-activity-id');



    var location = new google.maps.LatLng(32.715736, -117.161087)

    map = new google.maps.Map(document.getElementById('activity_map'), {
      center: location,
      scrollwheel: false,
      zoom: 12,
    });

    infoWindow = new google.maps.InfoWindow();
    $('.activity').each(function () {
      createMarker({'latitude': $(this).data('lat'),
                    'longitude': $(this).data('lng'),
                    'name': $(this).find('.name').html(),
                    'address': $(this).find('.location').html(),
                    'description': $(this).find('.description').html(),
                    'when': $(this).find('.next_at').html(),
                    'schedule': $(this).find('.schedule').html(),
                    'website': $(this).find('.website').html(),
                  })
    })
    var navigatorWindow = new google.maps.InfoWindow({map: map});
    var navigatorMarker = new google.maps.Marker({
      icon: {
        path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
        scale: 4,
        strokeColor: 'blue'
      },
      map: map
    });
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        navigatorMarker.setPosition(pos);
        navigatorWindow.setPosition(pos);
        navigatorWindow.setContent('Your Location');
        map.setCenter(pos);
      }, function() {
        handleLocationError(true, navigatorWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, navigatorWindow, map.getCenter());
    }
  }
  function handleLocationError(browserHasGeolocation, navigatorWindow, pos) {
    navigatorWindow.setPosition(pos);
    navigatorWindow.setContent(browserHasGeolocation ?
                          'Error: The Geolocation service failed.' :
                          'Error: Your browser doesn\'t support geolocation.');
  }

};

function createMarker(place){
  var marker = new google.maps.Marker({
    map: map,
    position: {lat: place.latitude, lng: place.longitude},
  });

  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(
    "<strong>" + "Activity: " + "</strong>" + place.name + "<br>" +
    "<strong>" + "Address: " + "</strong>" + place.address + "<br>" +
    "<strong>" + "Description: " + "</strong>" + place.description + "<br>" +
    "<strong>" + "When: " + "</strong>" + place.when + "<br>" +
    "<strong>" + "Schedule: " + "</strong>" + place.schedule + "<br>" +
    "<strong>" + "Website: " + "</strong>" + place.website);
    infoWindow.open(map, this);
  })
}
