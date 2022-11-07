<template>
  <div
    v-auto-animate
    class="category"
    :class="{
      'category--expanded': isExpanded,
    }"
    @dragover="isExpanded = true"
  >
    <div class="category__panel">
      <div
        class="category__toggle"
        @keyPress="toggle"
        @click="toggle"
      />
      <h2 class="category__name">
        {{ category.name }}
      </h2>
      <div
        v-if="category.perks.length > 0"
        class="category__perks"
      >
        <PerkDots :perks="category.perks" />
      </div>
      <div class="category__description">
        {{ category.description }}
      </div>
      <div class="category__controls">
        <ControlButtons />
      </div>
    </div>
    <div
      v-if="isExpanded"
      class="category__documents"
    >
      <slot />
    </div>
  </div>
</template>

<script>

import PerkDots from '@/components/PerkDots.vue';
import ControlButtons from '@/components/ControlButtons.vue';

export default {
  name: 'DocumentCategory',
  components: {
    PerkDots,
    ControlButtons,
  },
  props: {
    category: {
      type: Object,
      required: true,
    },
    autoExpand: {
      type: Boolean,
      default: false,
    },
  },
  data: () => ({
    isExpanded: false,
  }),
  created() {
    if (this.autoExpand) {
      this.isExpanded = true;
    }
  },
  methods: {
    toggle() {
      this.isExpanded = !this.isExpanded;
    },
  },
};

</script>

<style lang="scss" scoped>

.category {
  display: flex;
  flex-direction: column;
  background-color: #fff;

  &__panel {
    display: flex;
    align-items: center;
    height: 48px;
    padding: 0 16px;
    border: 1px solid #DFE4EF;
    flex-shrink: 0;
  }

  &__toggle {
    position: relative;
    width: 22px;
    height: 22px;
    border: 1px solid #D3D8DF;
    border-radius: 100%;
    flex-shrink: 0;
    cursor: pointer;

    &::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('@/assets/chevron.svg');
      background-position: center center;
      background-repeat: no-repeat;
      background-size: 8px auto;
      transition: transform 250ms ease-out;
    }
  }

  &--expanded &__toggle::after {
    transform: rotateZ(180deg);
  }

  &__name {
    margin: 0 15px;
    font-size: 15px;
    font-weight: 500;
    line-height: 108%;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  &__perks {
    margin-right: 15px;
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

  &__documents {
    position: relative;
    min-height: 34px;
    padding-left: 16px;
  }
}

</style>
