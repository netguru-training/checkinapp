$(document).ready(function(){
  if ($('.users.show').length == 0) { return }
  var addresspickerMap = $( "#addresspicker_map" ).addresspicker({
    regionBias: "fr",
    reverseGeocode: false,
    language: "en",
    updateCallback: showCallback,
    mapOptions: {
      zoom: 13,
      center: new google.maps.LatLng(gon.lat, gon.lng),
      // center: new google.maps.LatLng(52.40, 16.925),
      scrollwheel: true,
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
  gmarker.draggable(disabled);
  addresspickerMap.addresspicker( "updatePosition");



  function showCallback(geocodeResult, parsedGeocodeResult){
    street = parsedGeocodeResult.route + ' ' + (parsedGeocodeResult.street_number || '')
    $('#street').val(street)
  }
  // Update zoom field
  var map = $("#addresspicker_map").addresspicker("map");
  google.maps.event.addListener(map, 'idle', function(){
    $('#zoom').val(map.getZoom());
  });
})



