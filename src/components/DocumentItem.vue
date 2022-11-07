<template>
  <div class="document">
    <h3 class="document__name">
      {{ document.name }}
    </h3>
    <div
      v-if="document.perks.length > 0"
      class="document__perks"
    >
      <PerkDots :perks="document.perks" />
    </div>
    <div class="document__description">
      {{ document.description }}
    </div>
  </div>
</template>

<script>

import PerkDots from '@/components/PerkDots.vue';

export default {
  name: 'DocumentItem',
  components: {
    PerkDots,
  },
  props: {
    document: {
      type: Object,
      required: true,
    },
    required: {
      type: Boolean,
      default: false,
    },
  },
};

</script>

<style lang="scss" scoped>

.document {
  display: flex;
  align-items: center;
  height: 35px;
  padding: 0 16px;
  border: 1px solid #DFE4EF;
  box-sizing: border-box;

  &__name {
    margin-right: 15px;
    font-size: 13px;
    font-weight: 300;
    line-height: 108%;
  }

  &__perks {
    margin-right: 15px;
  }

  &__description {
    font-size: 11px;
    line-height: 108%;
    color: #8E9CBB;
  }

  &__documents {
    display: flex;
    padding-left: 16px;
  }
}

</style>
