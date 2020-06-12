const fetchFollowsIndexCardsSorted = (btnClassName, sortType) => {
  const viewers_filter = document.querySelector(btnClassName)
  if (viewers_filter) {
    viewers_filter.addEventListener("click",() => {
      fetch(`/dashboard/sorted_collection?sort=${sortType}`, {
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


export { fetchFollowsIndexCardsSorted, underlineSort };
