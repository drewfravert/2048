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
  emitted: false
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

  emit(direction) {

    const keyUpEvent = new KeyboardEvent(event.keyup, { key: direction })

    window.dispatchEvent(keyUpEvent)

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
    swipe.emitted = false;

  });

};

const bindTouchMove = () => {

  surface.addEventListener(event.touchmove, (event) => {

    event.preventDefault();

    const context = event.changedTouches[0];
    const distanceX = context.pageX - swipe.originX;
    const distanceY = context.pageY - swipe.originY;
    const absoluteX = Math.abs(distanceX);
    const absoluteY = Math.abs(distanceY);
    const axisX = absoluteX > absoluteY;
    const axisY = !axisX;

    if (axisX && (absoluteX >= threshold)) {

      swipe.direction = (distanceX > number.zero) ? key.right : key.left;

    } else if (axisY && (absoluteY >= threshold)) {

      swipe.direction = (distanceY > number.zero) ? key.down : key.up;

    }

    if (!swipe.emitted && swipe.direction) {

      swipe.emitted = true;

      Touch.emit(swipe.direction);

    }

  }, { passive: false });

};

const bindTouchStart = () => {

  surface.addEventListener(event.touchstart, (event) => {

    const context = event.changedTouches[0];

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
