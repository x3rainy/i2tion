import { initStarRating } from '../plugins/init_star_rating';

import "../plugins/flatpickr";

import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

import { initUpdateNavbarOnScroll } from '../components/navbar';

initMapbox();
initUpdateNavbarOnScroll();
initStarRating();
