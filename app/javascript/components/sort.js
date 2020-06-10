const fetchFollowsIndexCardsSortedByAlpha = () => {
  const alpha_filter = document.querySelector(".alpha-filter")
  if (alpha_filter) {
    alpha_filter.addEventListener("click",() => {
       fetch(`/dashboard/sorted_collection?sort=alpha`, {
      method: 'GET',
      }).then(response => response.text())
        .then((html) => {
          document.querySelector(".reloading-area").innerHTML = html;
      });
    });
  };
}

const fetchFollowsIndexCardsSortedByViewers = () => {
  const viewers_filter = document.querySelector(".viewers-filter")
  if (viewers_filter) {
    viewers_filter.addEventListener("click",() => {
      fetch(`/dashboard/sorted_collection?sort=views`, {
      method: 'GET',
      }).then(response => response.text())
        .then((html) => {
          document.querySelector(".reloading-area").innerHTML = html;
      });
    });
  };
}

const underlineSort = () => {
 const elements = document.querySelectorAll(".sort-btn")
 if (elements) {
    elements.forEach((btn) => btn.addEventListener("click",(e) => {
      elements.forEach((ele) => ele.classList.remove("underline"));
      e.currentTarget.classList.toggle("underline");
    }));
  };
}


export { fetchFollowsIndexCardsSortedByAlpha, fetchFollowsIndexCardsSortedByViewers,
underlineSort };
