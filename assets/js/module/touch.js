/*
==========================================================================================
  Dependencies
==========================================================================================
*/

import { now } from "lodash";
import { event } from "../global/browser.js";
import { key, number } from "../global/constants.js";

/*
==========================================================================================
  Constants
==========================================================================================
*/

const duration = 300;
const swipe = {};
const threshold = 150;

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

  // window.addEventListener(event.touchcancel, (event) => event.preventDefault());

};

const bindTouchEnd = () => {

  window.addEventListener(event.touchend, (event) => {

    event.preventDefault();

    const context = event.changedTouches[0];
    const distanceX = context.pageX - swipe.originX;
    const distanceY = context.pageY - swipe.originY;
    const swipeAxis = (Math.abs(distanceX) > Math.abs(distanceY)) ? "horizontal" : "vertical";
    const elapsedTime = now() - swipe.startTime;

    if (elapsedTime <= duration) {

      if ((swipeAxis === "horizontal") && (Math.abs(distanceX) >= threshold)) {

        swipe.direction = (distanceX > number.zero) ? key.right : key.left;

      } else if ((swipeAxis === "vertical") && (Math.abs(distanceY) >= threshold)) {

        swipe.direction = (distanceY > number.zero) ? key.down : key.up;

      }

    }

    Touch.emit(swipe.direction);

  });

};

const bindTouchMove = () => {

  window.addEventListener(event.touchmove, (event) => event.preventDefault());

};

const bindTouchStart = () => {

  window.addEventListener(event.touchstart, (event) => {

    event.preventDefault();

    const context = event.changedTouches[0];

    swipe.direction = null;
    swipe.distance = number.zero;
    swipe.originX = context.pageX;
    swipe.originY = context.pageY;
    swipe.startTime = now();

  });

};

/*
==========================================================================================
  Exports
==========================================================================================
*/

export default Touch;
