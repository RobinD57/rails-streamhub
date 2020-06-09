const fetchFollowsIndexCardsSortedByAlpha = () => {
  fetch(`/dasboard/sorted_collection?sort='alpha'`, {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
    'X-CSRF-Token': Rails.csrfToken(),
    'Content-Type': 'application/json',
    Accept: 'application/javascript'
  },
    body: JSON.stringify(body)
}).then(response => response.json())
  .then((data) => {
    console.log(data);
  });
}

const fetchFollowsIndexCardsSortedByViewers = () => {
  fetch(`/dasboard/sorted_collection?sort='views'`, {
    method: 'POST',
    credentials: 'same-origin',
    headers: {
    'X-CSRF-Token': Rails.csrfToken(),
    'Content-Type': 'application/json',
    Accept: 'application/javascript'
  },
    body: JSON.stringify(body)
}).then(response => response.json())
  .then(data)
}

export { fetchFollowsIndexCardsSortedByAlpha, fetchFollowsIndexCardsSortedByViewers };
