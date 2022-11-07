<template>
  <div id="app">
    <TheDocuments />
  </div>
</template>

<script>

import TheDocuments from '@/components/TheDocuments.vue';

export default {
  name: 'App',
  components: {
    TheDocuments,
  },
};
</script>

<style lang="scss">

@import 'normalize.css';

@font-face {
  font-family: FiraSans;
  font-style: normal;
  font-weight: 400;
  src:
    local('FiraSans'),
    local('FiraSans-Regular'),
    url('@/assets/fonts/fira-sans/400.woff')
    format('woff');
}

@font-face {
  font-family: FiraSans;
  font-style: normal;
  font-weight: 500;
  src:
    local('FiraSans Medium'),
    local('FiraSans-Medium'),
    url('@/assets/fonts/fira-sans/500.woff')
    format('woff');
}

#app {
  font-family: FiraSans, sans-serif;
  padding: 40px 30px;
}

</style>
