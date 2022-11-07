<template>
  <label
    class="search-input"
    :class="{
      'search-input--can-clear': sanitizedValue.length > 0,
    }"
    for="search"
  >
    <span class="search-input__icon" />
    <input
      v-model="localValue"
      class="search-input__control"
      placeholder="Поиск"
      autocomplete="off"
      @input="emitValue"
    >
    <span
      class="search-input__clear"
      @click="clear"
      @keypress="clear"
    />
  </label>
</template>

<script>

export default {
  name: 'SearchInput',
  props: {
    value: {
      type: String,
      required: true,
    },
  },
  data: () => ({
    localValue: '',
  }),
  computed: {
    sanitizedValue() {
      return String(this.localValue ?? '').trim();
    },
  },
  mounted() {
    this.localValue = this.value;
  },
  methods: {
    emitValue() {
      this.$emit('input', this.localValue);
    },
    clear() {
      this.localValue = '';
      this.emitValue();
    },
  },
};

</script>

<style lang="scss" scoped>

.search-input {
  position: relative;
  display: flex;

  &__icon {
    position: absolute;
    top: 0;
    left: 0;
    width: 20px;
    height: 100%;
    background-image: url('@/assets/search.svg');
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 14px auto;
  }

  &__control {
    width: 100%;
    height: 45px;
    padding: 0 26px;
    border: 0;
    outline: 0;
    font-size: 15px;
    font-weight: 400;
    border-bottom: 1px solid #BFC9E0;
    transition: border-bottom-color 250ms ease-in-out;

    &::placeholder {
      font-style: italic;
      color: #8E9CBB;
    }

    &:focus {
      border-bottom-color: #0066FF;
    }
  }

  &__clear {
    position: absolute;
    top: 0;
    right: 0;
    width: 20px;
    height: 100%;
    background-image: url('@/assets/cross.svg');
    background-position: center center;
    background-repeat: no-repeat;
    background-size: 12px auto;
    transition: opacity 250ms ease-in-out;
    cursor: pointer;
  }

  &:not(&--can-clear) &__clear {
    pointer-events: none;
    opacity: 0;
  }
}

</style>
