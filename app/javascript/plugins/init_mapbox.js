import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
  return map;
};

const fitMapToMarkers = (map, markers) => {
const bounds = new mapboxgl.LngLatBounds();
markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  });
};

const userCurrentPosition = (map, mapElement) => {
  console.log(map);
  console.log(mapElement);
  navigator.geolocation.getCurrentPosition((location) => {
  const current_position = JSON.parse(mapElement.dataset.current_position);

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'current_position';
    element.style.backgroundImage = `url('${current_position.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '25px';
    element.style.height = '25px';
    console.log(element);
    // Pass the element as an argument to the new marker
    const user_position = new mapboxgl.Marker(element)
      .setLngLat([location.coords.longitude, location.coords.latitude])
      .addTo(map);
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    markers.forEach((marker) => {
      // Create a HTML element for your custom marker
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const icon = document.createElement('div');
      icon.className = 'marker';
      icon.style.backgroundImage = `url('${marker.image_url}')`;
      icon.style.backgroundSize = 'contain';
      icon.style.width = '35px';
      icon.style.height = '35px';
      icon.style.backgroundRepeat = 'no-repeat';
      new mapboxgl.Marker(icon)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    })
    console.log(markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    userCurrentPosition(map, mapElement);
  };

};



// const addCoordToForm = (coordinates) => {
//   const lats = document.querySelectorAll(".hidden-lat")
//   lats.forEach((input) => {
//     input.value = coordinates.latitude
//   })
//   const lons = document.querySelectorAll(".hidden-lon")
//   lons.forEach((input) => {
//     input.value = coordinates.longitude
//   })
// }

export { initMapbox };
