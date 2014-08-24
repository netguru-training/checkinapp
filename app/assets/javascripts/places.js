$(document).ready(function(){
  if ($('.places.new').length == 0) { return }
  
  var addresspicker = $( "#addresspicker" ).addresspicker({
    componentsFilter: 'country:FR'
  });
  var addresspickerMap = $( "#addresspicker_map" ).addresspicker({
    regionBias: "fr",
    reverseGeocode: true,
    language: "en",
    updateCallback: showCallback,
    mapOptions: {
      zoom: 13,
      center: new google.maps.LatLng(52.40, 16.925),
      scrollwheel: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    },
    elements: {
      map:      "#map",
      lat:      "#lat",
      lng:      "#lng",
      street_number: '#street_number',
      route: '#route',
      locality: '#locality',
      sublocality: '#sublocality',
      administrative_area_level_3: '#administrative_area_level_3',
      administrative_area_level_2: '#administrative_area_level_2',
      administrative_area_level_1: '#administrative_area_level_1',
      country:  '#country',
      postal_code: '#postal_code',
      type:    '#type'
    }
  });

  var gmarker = addresspickerMap.addresspicker( "marker");
  gmarker.setVisible(true);
  addresspickerMap.addresspicker( "updatePosition");

  

  function showCallback(geocodeResult, parsedGeocodeResult){
    $('#callback_result').text(JSON.stringify(parsedGeocodeResult, null, 4));
  }
  // Update zoom field
  var map = $("#addresspicker_map").addresspicker("map");
  google.maps.event.addListener(map, 'idle', function(){
    $('#zoom').val(map.getZoom());
  });
})
