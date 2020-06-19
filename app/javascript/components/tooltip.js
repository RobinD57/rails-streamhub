import tippy from 'tippy.js';

const showToolTip = () => {
  const uname = document.querySelector("#question-mark").dataset.uname
  tippy('#question-mark', {
    content: `Dlive will <strong>only</strong> connect accounts which have a username of: <u>${uname}<u>` ,
    animation: 'shift-away',
    allowHTML: true,
    placement: "right"
  });
};

export { showToolTip };
