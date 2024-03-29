// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#review_stars').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };