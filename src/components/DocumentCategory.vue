<template>
  <div
    v-auto-animate
    class="category"
    :class="{
      'category--expanded': isExpanded,
    }"
  >
    <div class="category__panel">
      <div
        class="category__toggle"
        @keyPress="expand"
        @click="expand"
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
    </div>
    <div
      v-if="isExpanded"
      class="category__documents"
    >
        <DocumentList>
      <v-draggable
        :list="category.documents"
        ghost-class="ghost"
        group="documents"
        filter=".category__placeholder"
        animation="250"
      >
        <DocumentItem
          v-for="(document, documentIndex) in category.documents"
          :key="`doc_${documentIndex}`"
          :document="document"
        />
        <div class="category__placeholder">
          Категория не содержит документов
        </div>
      </v-draggable>
        </DocumentList>
    </div>
  </div>
</template>

<script>

import PerkDots from '@/components/PerkDots.vue';
import DocumentList from '@/components/DocumentList.vue';
import DocumentItem from '@/components/DocumentItem.vue';

export default {
  name: 'DocumentCategory',
  components: {
    PerkDots,
    DocumentList,
    DocumentItem,
  },
  props: {
    category: {
      type: Object,
      required: true,
    },
  },
  data: () => ({
    isExpanded: true,
  }),
  methods: {
    expand() {
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
  overflow: hidden;

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
    position: relative;
    display: flex;
    flex-direction: column;
    padding-left: 16px;
    margin-top: -1px;
    min-height: 35px;
  }

  &__placeholder {
    display: flex;
    align-items: center;
    height: 34px;
    padding: 0 16px;
    border: 1px solid #DFE4EF;
    box-sizing: border-box;
    font-style: italic;
    font-size: 12px;
    opacity: 0.5;
    transition: opacity 250ms ease-in-out;

    &:not(:only-child) {
      pointer-events: none;
      margin-top: -34px;
      opacity: 0;
    }
  }
}

</style>
