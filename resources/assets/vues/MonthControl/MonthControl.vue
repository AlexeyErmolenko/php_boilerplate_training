<template>
  <div class="slider-month">

    <button id='nav-next' type="button" data-role="none" aria-label="Previous" role="button" v-on:click="prev">
      <svg class="ic-arrow-left">
        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ic-arrow-left"></use>
      </svg>
    </button>

    <div class="slider-month__item">{{items[selectedItem].month}}</div>

    <button id='nav-prev' type="button" data-role="none" aria-label="Previous" role="button" v-on:click="next">
      <svg class="ic-arrow-right">
        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#ic-arrow-right"></use>
      </svg>
    </button>

  </div>
</template>

<script>

  export default {

    data() {
      return {
        selectedItem: 0,
        items: [
          { month: 'January' },
          { month: 'February' },
          { month: 'March' },
          { month: 'April' },
          { month: 'May' },
          { month: 'June' },
          { month: 'July' },
          { month: 'August' },
          { month: 'September' },
          { month: 'October' },
          { month: 'November' },
          { month: 'December' },
        ],
      };
    },

    methods: {
      next() {
        if (this.selectedItem < this.items.length) {
          this.selectedItem = this.selectedItem + 1;
        }
      },

      prev() {
        if (this.selectedItem > 0) {
          this.selectedItem = this.selectedItem - 1;
        }
      },
    },
  };
</script>
