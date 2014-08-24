$(document).ready(function() {
  if ($('.home.index').length == 0) { return }

  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(52.4068254, 16.9270717)
  }

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  if (gon.markers.length == 0) { return }
  for(var i = 0; i < gon.markers.length; i++) {
    var position = new google.maps.LatLng(gon.markers[i][0], gon.markers[i][1]);
    var marker = new google.maps.Marker({
        position: position,
        map: map
    });
  }
});
