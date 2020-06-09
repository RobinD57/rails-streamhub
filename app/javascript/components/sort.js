const fetchFollowsIndexCardsSortedByAlpha = () => {
  document.querySelector(".alpha-filter").addEventListener("click",() => {
     fetch(`/dashboard/sorted_collection?sort=alpha`, {
    method: 'GET',
    }).then(response => response.text())
      .then((html) => {
        document.querySelector(".reloading-area").innerHTML = html;
    });
  });
}

const fetchFollowsIndexCardsSortedByViewers = () => {
  document.querySelector(".viewers-filter").addEventListener("click",() => {
    fetch(`/dashboard/sorted_collection?sort=views`, {
    method: 'GET',
    }).then(response => response.text())
      .then((html) => {
        document.querySelector(".reloading-area").innerHTML = html;
    });
  });
}

export { fetchFollowsIndexCardsSortedByAlpha, fetchFollowsIndexCardsSortedByViewers };
