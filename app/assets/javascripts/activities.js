
// $(document).ready(function(){
var handler = Gmaps.build('Google');

  function createGmap(dataFromServer) {
    handler.buildMap({
        provider: {},
        internal: {id: 'activity_map'}
      },
      function() {
        showLocations(dataFromServer);
      }
    );
  };

  function placeMarkers(dataFromServer) {
    var markers = handler.addMarkers(dataFromServer);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(15);
  }

  function showLocations(dataFromServer){
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
        // Add our position to the collection of markers
        dataFromServer[dataFromServer.length] = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
          infowindow: "You!"
        };
        placeMarkers(dataFromServer);
      });
    } else {
        alert("Geolocation is not available.");
        placeMarkers(dataFromServer)
    }
  }



  function loadAndCreateGmap() {
    // Only load map data if we have a map on the page
    if ($('#activity_map').length > 0 ){
      // Access the data-activity-id attribute on the map element
      var activityId = $('#activity_map').attr('data-activity-id');
      $.ajax({
        dataType: 'json',
        url: '/activities/map_location',
        method: 'GET',
        success: function(dataFromServer) {
          createGmap(dataFromServer);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Getting map data failed: " + errorThrown);
        }
      });
    }
    else if ($("#activity_map").length > 0) {
      $.ajax({
        dataType: 'json',
        url: '/all_markers',
        method: 'GET',
        success: function(dataFromServer) {
          createGmap(dataFromServer);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          alert("Getting map data failed: " + errorThrown);
        }
      })
    };
  };
  // Create the map when the page loads the first time
  $(document).on('ready', loadAndCreateGmap);
  // Create the map when the contents is loaded using turbolinks
  $(document).on('turbolinks:load', loadAndCreateGmap);
  // To be 'turbolinks:load' in Rails 5
  $(document).on('page:load', loadAndCreateGmap)
// });
