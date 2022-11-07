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
    <div
      v-if="required"
      class="document__required"
    >
      Обязательный
    </div>
    <div class="document__description">
      {{ document.description }}
    </div>
    <div class="document__controls">
      <ControlButtons />
    </div>
  </div>
</template>

<script>

import PerkDots from '@/components/PerkDots.vue';
import ControlButtons from '@/components/ControlButtons.vue';

export default {
  name: 'DocumentItem',
  components: {
    PerkDots,
    ControlButtons,
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
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  &__perks {
    margin-right: 15px;
    flex-shrink: 0;
  }

  &__required {
    margin-right: 16px;
    font-size: 11px;
    color: #FF238D;
    flex-shrink: 0;
  }

  &__description {
    margin-right: 20px;
    font-size: 11px;
    line-height: 108%;
    color: #8E9CBB;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    min-width: 0;
  }

  &__controls {
    margin-left: auto;
  }
}

</style>
