<template>
  <div class="document-list">
    <slot />
  </div>
</template>

<script>

export default {
  name: 'DocumentList',
};

</script>

<style lang="scss" scoped>

.document-list {
  display: flex;
  flex-direction: column;

  .document + .document {
    margin-top: -1px;
  }
}

</style>
