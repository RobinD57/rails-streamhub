let timer;
let defaultCard;
let frame;
let iframe;

const initEmbeddedStream = () => {
  const cards = document.querySelectorAll(".main-card");
  if (cards) {
    cards.forEach((card) => card.addEventListener("mouseover", (event) => {
      defaultCard = card.innerHTML;
      const embedWrapper = card.querySelector(".embedWrapper");
      embedWrapper.innerHTML = '<iframe style="display: none;" title="PaladinsGame\'s player frame" i18n-title="channel#ShareDialog:playerEmbedFrame|Embed player Frame copied from share dialog" allowfullscreen="true" src="https://mixer.com/embed/player/PaladinsGame?disableLowLatency=1" width="400" height="250"> </iframe>'
      timer = setTimeout(function() {
        iframe = embedWrapper.querySelector("iframe")
        iframe.style.display = "block"
      }, 8000);
    }) /*.addEventListener("mouseleave", (event) => {
        clearTimeout(timer);
        iframe.style.display = "none";
                setTimeout(function() {
          card.classList.remove("hidden")
        }, 1000)

    }) */
    );
    cards.forEach((card) => card.addEventListener("mouseleave", (event) => {
      clearTimeout(timer);
      card.style.display = defaultCard;
    }));
  }
}

export { initEmbeddedStream }

/*
maybe dataset in card for building the iframe for retrieving the user
select each card, 2 event listener: one time out for loading video, second one for change hidden class,
on mouse leave set timeout + display="none" (maybe play with opacity, CSS animation)


<iframe title="PaladinsGame's player frame" i18n-title="channel#ShareDialog:playerEmbedFrame|Embed player Frame copied from share dialog" allowfullscreen="true" src="https://mixer.com/embed/player/PaladinsGame?disableLowLatency=1" width="620" height="349"> </iframe>

<video class="thumbnailVideo_1TKLL" loop="" autoplay=""><source src="https://thumbs.mixer.com/channel/8215082.m4v" type="video/mp4"></video>
*/
