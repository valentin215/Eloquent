import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('city');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocompleteCourse = () => {
  const addressInput = document.getElementById('course_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
export { initAutocompleteCourse };
