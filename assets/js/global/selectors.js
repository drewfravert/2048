/*
==========================================================================================
  Selectors
==========================================================================================
*/

// global selectors
const html = document.documentElement;

// head selectors
const head = html.querySelector("head");
const csrfToken = head.querySelector("meta[name='csrf-token']");

// body selectors
const body = html.querySelector("body");

const Selectors = { html, head, body, csrfToken };

/*
==========================================================================================
  Exports
==========================================================================================
*/

export { html, head, body, csrfToken };

export default Selectors;
