/*
==========================================================================================
  Selectors
==========================================================================================
*/

const Selectors: Object = {};

// global selectors
Selectors.document = document.documentElement;
Selectors.html = document.querySelector("html");

// head selectors
Selectors.head = Selectors.html.querySelector("head");
Selectors.csrfToken = Selectors.head.querySelector("meta[name='csrf-token']");

// body selectors
Selectors.body = Selectors.html.querySelector("body");
Selectors.main = Selectors.body.querySelector(".main");

/*
==========================================================================================
  Exports
==========================================================================================
*/

export default Selectors;
