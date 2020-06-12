let frame;
let iframe;

const initEmbeddedStream = () => {
  const cards = document.querySelectorAll(".main-card");
  if (cards) {
    cards.forEach((card) => card.addEventListener("mouseenter", (event) => {
      /* embedWrapper.innerHTML = '<iframe title="PaladinsGame\'s player frame" i18n-title="channel#ShareDialog:playerEmbedFrame|Embed player Frame copied from share dialog" allowfullscreen="true" src="https://mixer.com/embed/player/PaladinsGame?disableLowLatency=1" width="400" height="250"> </iframe>' */
      timer = setTimeout(function() {
        const embedWrapper = card.querySelector(".embedWrapper");
        const iframe = embedWrapper.querySelector("iframe");
        iframe.src = "https://mixer.com/embed/player/ChefSsef?disableLowLatency=1"
        embedWrapper.style.display = "block";
      }, 2000);
    }));
    cards.forEach((card) => card.addEventListener("mouseleave", (event) => {
      const embedWrapper = card.querySelector(".embedWrapper");
      const iframe = embedWrapper.querySelector("iframe")
      iframe.src = ""
      embedWrapper.style.display = "none";
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
