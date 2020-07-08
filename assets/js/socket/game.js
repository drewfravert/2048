/*
==========================================================================================
  Dependencies
==========================================================================================
*/

import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import NProgress from "nprogress";
import { csrfToken } from "../global/selectors.js";

/*
==========================================================================================
  Constants
==========================================================================================
*/

const gameEndpoint = "/game/live";
const gameSocket = new LiveSocket(gameEndpoint, Socket, {
  params: {
    _csrf_token: csrfToken.getAttribute("content")
  }
});

/*
==========================================================================================
  Public Functions
==========================================================================================
*/

const Game = {

  initialize() {

    bindNProgress();

    gameSocket.connect();
    window.Game = gameSocket;

  }

};

/*
==========================================================================================
  Private Functions
==========================================================================================
*/

const bindNProgress = () => {

  window.addEventListener("phx:page-loading-start", (info) => NProgress.start());
  window.addEventListener("phx:page-loading-stop", (info) => NProgress.done());

};

/*
==========================================================================================
  Exports
==========================================================================================
*/

export default Game;
