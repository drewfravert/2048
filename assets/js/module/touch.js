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

const surface = document.documentElement;
const swipe = {
  direction: null,
  distance: number.zero,
  dispatched: false
};
const threshold = number.ten * number.two; // 20

/*
==========================================================================================
  Public Functions
==========================================================================================
*/

const Touch = {

  initialize() {

    bindTouchSurface();

  },

  dispatchKeyEvent(direction) {

    const keyEvent = new KeyboardEvent(event.keyup, { key: direction })

    window.dispatchEvent(keyEvent)

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

};

const bindTouchEnd = () => {

  surface.addEventListener(event.touchend, (event) => {

    swipe.direction = null;
    swipe.distance = number.zero;
    swipe.notDispatched = true;

  });

};

const bindTouchMove = () => {

  surface.addEventListener(event.touchmove, (event) => {

    event.preventDefault();

    const context = touchContext(event);
    const distanceX = context.pageX - swipe.originX;
    const distanceY = context.pageY - swipe.originY;
    const absoluteX = Math.abs(distanceX);
    const absoluteY = Math.abs(distanceY);
    const axisX = absoluteX > absoluteY;
    const axisY = !axisX;

    if (axisX && (absoluteX >= threshold)) {

      swipe.direction = (distanceX < number.zero) ? key.left : key.right;

    } else if (axisY && (absoluteY >= threshold)) {

      swipe.direction = (distanceY < number.zero) ? key.up : key.down;

    }

    if (swipe.notDispatched && swipe.direction) {

      swipe.notDispatched = false;

      Touch.dispatchKeyboardEvent(swipe.direction);

    }

  }, { passive: false });

};

const bindTouchStart = () => {

  surface.addEventListener(event.touchstart, (event) => {

    const context = touchContext(event);

    swipe.originX = context.pageX;
    swipe.originY = context.pageY;

  });

};

const touchContext = (event) => event.changedTouches[0];

/*
==========================================================================================
  Exports
==========================================================================================
*/

export default Touch;
