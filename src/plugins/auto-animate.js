import Vue from 'vue';

import autoAnimate from '@formkit/auto-animate';

Vue.directive('auto-animate', {
  inserted(el, binding) {
    autoAnimate(el, binding.value);
  },
});
