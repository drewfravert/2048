/*
==========================================================================================
  Browser
==========================================================================================
*/

// events list
const event = {
  blur: "blur",
  click: "click",
  change: "change",
  focus: "focus",
  focusin: "focusin",
  focusout: "focusout",
  input: "input",
  keydown: "keydown",
  keyup: "keyup",
  mousedown: "mousedown",
  mouseup: "mouseup",
  scroll: "scroll",
  submit: "submit",
  wheel: "wheel",
};

// event dispatchers
const dispatch = {};

Object.keys(event).forEach((e) =>
  dispatch[e] = new Event(e, { bubbles: true, cancelable: true })
);

// http methods
const request = {
  get: "GET",
  post: "POST",
  patch: "PATCH",
  delete: "DELETE",
};

const Browser = { event, dispatch, request };

/*
==========================================================================================
  Exports
==========================================================================================
*/

export { event, dispatch, request };

export default Browser;
