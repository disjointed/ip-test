<template>
  <div class="control-buttons">
    <button
      class="control-buttons__button control-buttons__button--edit"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/pencil.svg"
        alt="edit"
      >
    </button>
    <button
      class="control-buttons__button control-buttons__button--remove"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/trash.svg"
        alt="remove"
      >
    </button>
    <button
      class="control-buttons__button control-buttons__button--drag drag-handle"
      type="button"
    >
      <img
        svg-inline
        src="@/assets/arrows.svg"
        alt="drag"
      >
    </button>
  </div>
</template>

<script>

export default {
  name: 'ControlButtons',
};

</script>

<style lang="scss" scoped>

.control-buttons {
  display: inline-flex;
  align-items: center;
  gap: 12px;

  &__button {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 25px;
    height: 25px;
    border: 0;
    border-radius: 100%;
    transition: background-color 250ms ease-in-out;
    cursor: pointer;
    color: #8E9CBB;

    &--remove {
      color: #FF238D;
    }

    &:not(:hover) {
      background-color: transparent;
    }

    &:active {
      background-color: rgba(gray, 0.2);
    }

    svg {
      max-width: 15px;
      max-height: 15px;
      outline: none;
    }
  }
}

</style>
