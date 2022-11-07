<template>
  <div class="perk-dots">
    <i
      v-for="(perk, perkIndex) in perks"
      :key="`perk_${perkIndex}`"
      class="perk-dots__perk"
      :style="{
        backgroundColor: perk,
      }"
    />
  </div>
</template>

<script>

export default {
  name: 'PerkDots',
  props: {
    perks: {
      type: Array,
      required: true,
    },
  },
};

</script>

<style lang="scss" scoped>

.perk-dots {
  display: inline-flex;
  align-items: center;
  gap: 6px;

  &__perk {
    width: 8px;
    height: 8px;
    border-radius: 100%;
  }
}

</style>
