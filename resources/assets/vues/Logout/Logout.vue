<template>

  <div>
    <a href="#" class="link-logout" @click="activeLink">
      <span>
        Log Out
      </span>
    </a>
  </div>

</template>

<script>

  export default {
    name: 'logout',
    methods: {
      activeLink(e) {
        e.target.className = (e.target.className === 'link-logout noclass') ? 'link-logout active' : 'link-logout noclass';
      },
    },
  };
</script>
