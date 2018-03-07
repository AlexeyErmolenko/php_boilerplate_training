import Vue from 'vue';

const ESCAPE_KEY = 27;

export default Vue.extend({
  data() {
    return {
      menuShown: false,
    };
  },
  mounted() {
    $('body').on('click', () => {
      this.menuShown = false;
    }).on('keydown', (ev) => {
      if (ev.keyCode === ESCAPE_KEY) {
        this.menuShown = false;
      }
    });
  },
});
