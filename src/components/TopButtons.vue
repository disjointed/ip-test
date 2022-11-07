<template>
  <div class="top-buttons">
    <button
      class="top-buttons__button top-buttons__button--round"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/bookmark.svg"
        alt="bookmark"
      >
    </button>
    <button
      class="top-buttons__button"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/plus.svg"
        alt="Add type"
      >
      <span>
        Новый тип
      </span>
    </button>
    <button
      class="top-buttons__button"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/plus.svg"
        alt="Add document"
      >
      <span>
        Новый документ
      </span>
    </button>
  </div>
</template>

<script>

export default {
  name: 'TopButtons',
};

</script>

<style lang="scss" scoped>

.top-buttons {
  display: inline-flex;
  align-items: center;
  gap: 10px;

  &__button {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 30px;
    padding: 0 8px;
    border: 1px solid #D3D8DF;
    border-radius: 50px;
    box-sizing: border-box;
    transition: 250ms ease-in-out;
    transition-property: background-color, border-color;
    cursor: pointer;

    &--remove {
      color: #FF238D;
    }

    &:not(:hover) {
      background-color: transparent;
    }

    &:active {
      border-color: #0066FF;
      background-color: rgba(#0066FF, 0.2);
    }

    svg {
      max-width: 14px;
      max-height: 14px;
      outline: none;
    }

    span {
      margin: 0 10px;
      font-weight: 500;
      font-size: 12px;
      line-height: 108%;
    }
  }
}

</style>
