
const showToolTip = () => {
  const tooltipQuestion = document.querySelector("#question-mark");
  tooltipQuestion.tooltip("data-animation=true");
  tooltipQuestion.addEventListener("hover", ((event) => {
    tooltipQuestion.tooltip("show");
  }));
};

export { showToolTip };
