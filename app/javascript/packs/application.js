// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "popper.js";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { toggleCaret } from '../components/navbar';
import { shrinkAndGrowNav } from '../components/navbar';
import { quickLoad } from '../components/cards';
import { checkLoad } from '../components/loader';
import { fetchFollowsIndexCardsSorted } from '../components/sort';
import { underlineSort } from '../components/sort';
import { closeNav } from '../components/navbar';
import { initEmbeddedStream } from '../components/embedded_stream';
import { linkAccountButton } from '../components/link_account_button';
import { firstSignUp } from '../components/first_sign_up';
import { removeQueryParams } from '../components/remove_query_params';
import { showToolTip } from '../components/tooltip';


document.addEventListener('turbolinks:load', () => {
  initEmbeddedStream();
  linkAccountButton();
  checkLoad();
  firstSignUp();
  removeQueryParams();
  toggleCaret();
  shrinkAndGrowNav();
  Turbolinks.setProgressBarDelay(500);
  fetchFollowsIndexCardsSorted(".alpha-filter", "alpha");
  fetchFollowsIndexCardsSorted(".views-filter", "views");
  underlineSort();
  closeNav();
  showToolTip();
});

