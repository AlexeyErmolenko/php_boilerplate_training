<template>
  <table class="table table-hover">
    <thead class="thead">

    </thead>
  </table>
</template>

<script>
/* eslint-disable */
const baseOptions = {
    processing: true,
    serverSide: true
};

export default {
    name: 'table',
    mounted: function () {
        const options = Object.assign(baseOptions, this.$parent.options);

        jQuery(this.$el).dataTable(options);
    }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  h1, h2 {
  }

  ul {
    font-weight: normal;
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }
</style>
