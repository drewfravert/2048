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
  touchcancel: "touchcancel",
  touchend: "touchend",
  touchmove: "touchmove",
  touchstart: "touchstart",
  wheel: "wheel",
};

// event dispatchers
const dispatch = {};

Object.keys(event).forEach((e) => {

  dispatch[e] = new Event(e, {
    bubbles: true,
    cancelable: true
  });

});

const Browser = { event, dispatch };

/*
==========================================================================================
  Exports
==========================================================================================
*/

export { event, dispatch };

export default Browser;
