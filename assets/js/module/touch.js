/*
==========================================================================================
  Dependencies
==========================================================================================
*/

import { event } from "../global/browser.js";
import { key, number } from "../global/constants.js";

/*
==========================================================================================
  Constants
==========================================================================================
*/

const swipe = {};
const threshold = 20;

/*
==========================================================================================
  Public Functions
==========================================================================================
*/

const Touch = {

  initialize() {

    bindTouchSurface();

  },

  emit(direction) {

    if (direction) {

      const keyUpEvent = new KeyboardEvent(event.keyup, { key: direction })

      window.dispatchEvent(keyUpEvent)

    }

  }

};

/*
==========================================================================================
  Private Functions
==========================================================================================
*/

const bindTouchSurface = () => {

  bindTouchStart();
  bindTouchMove();
  bindTouchEnd();
  bindTouchCancel();

};

const bindTouchCancel = () => {

  // document.addEventListener(event.touchcancel, (event) => event.preventDefault());

};

const bindTouchEnd = () => {

  document.addEventListener(event.touchend, (event) => {

    const context = event.changedTouches[0];
    const distanceX = context.pageX - swipe.originX;
    const distanceY = context.pageY - swipe.originY;
    const swipeAxis = (Math.abs(distanceX) > Math.abs(distanceY)) ? "horizontal" : "vertical";

    if ((swipeAxis === "horizontal") && (Math.abs(distanceX) >= threshold)) {

      swipe.direction = (distanceX > number.zero) ? key.right : key.left;

    } else if ((swipeAxis === "vertical") && (Math.abs(distanceY) >= threshold)) {

      swipe.direction = (distanceY > number.zero) ? key.down : key.up;

    }

    Touch.emit(swipe.direction);

  });

};

const bindTouchMove = () => {

  document.addEventListener(event.touchmove, (event) => {

    event.preventDefault();

  }, { passive: false });

};

const bindTouchStart = () => {

  document.addEventListener(event.touchstart, (event) => {

    const context = event.changedTouches[0];

    swipe.direction = null;
    swipe.distance = number.zero;
    swipe.originX = context.pageX;
    swipe.originY = context.pageY;

  });

};

/*
==========================================================================================
  Exports
==========================================================================================
*/

export default Touch;
