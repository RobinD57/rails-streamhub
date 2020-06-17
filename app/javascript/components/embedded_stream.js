let timer;

const initEmbeddedStream = () => {
  const cards = document.querySelectorAll(".main-card");
  if (cards) {
    cards.forEach((card) => card.addEventListener("mouseenter", (event) => {
      console.log(event);
      timer = setTimeout(function() {
        const embedWrapper = card.querySelector(".embedWrapper");
        const iframe = embedWrapper.querySelector("iframe");
        if (embedWrapper.dataset.source === "mixer") {
          iframe.src = `https://mixer.com/embed/player/${embedWrapper.dataset.streamer}?disableLowLatency=1`;
        } else if (embedWrapper.dataset.source === "twitch") {
          iframe.src = `https://player.twitch.tv/?channel=${embedWrapper.dataset.streamer}&muted=true&autoplay=true&parent=www.streamhub.watch`;
        }
        embedWrapper.style.display = "block";
      }, 7000);
    }));
    cards.forEach((card) => card.addEventListener("mouseleave", (event) => {
      console.log(event);
      setTimeout(function() {
      const embedWrapper = card.querySelector(".embedWrapper");
      const iframe = embedWrapper.querySelector("iframe");
      iframe.src = "";
      embedWrapper.style.display = "none";
      clearTimeout(timer);
      }, 300);
    }));
  }
}

export { initEmbeddedStream }

/*
maybe dataset in card for building the iframe for retrieving the user


<iframe title="PaladinsGame's player frame" i18n-title="channel#ShareDialog:playerEmbedFrame|Embed player Frame copied from share dialog" allowfullscreen="true" src="https://mixer.com/embed/player/PaladinsGame?disableLowLatency=1" width="620" height="349"> </iframe>

<video class="thumbnailVideo_1TKLL" loop="" autoplay=""><source src="https://thumbs.mixer.com/channel/8215082.m4v" type="video/mp4"></video>
*/
