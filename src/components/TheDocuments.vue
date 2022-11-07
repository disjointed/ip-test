<template>
  <div class="documents">
    <h1 class="documents__title">
      Документы
    </h1>
    <div
      v-for="(category, categoryIndex) in categories"
      :key="`cat_${categoryIndex}`"
      class="documents__category"
    >
      <Category :category="category" />
    </div>
  </div>
</template>

<script>

import Category from './DocumentCategory.vue';

export default {
  name: 'TheDocuments',
  components: {
    Category,
  },
  data: () => ({
    categories: [
      {
        name: 'Обязятельные для всех',
        description: 'Документы, обязательные для всех сотрудников без исключения',
        perks: ['#FF238D', '#FFB800', '#FF8D23'],
        documents: [
          {
            name: 'Паспорт',
            description: 'Для всех',
            perks: ['#00C2FF'],
          },
          {
            name: 'ИНН',
            description: 'Для всех',
            perks: [],
          },
        ],
        required: true,
      },
      {
        name: 'Обязательные для трудоустройства',
        description: 'Документы, без которых невозможно трудоустройство человека на какую бы то ни было должность в компании вне зависимости от гражданства',
        perks: [],
        documents: [],
        required: false,
      },
      {
        name: 'Специальные',
        description: '',
        perks: [],
        documents: [],
        required: false,
      },
    ],
    uncategorizedDocuments: [
      {
        name: 'Тестовое задание кандидата',
        description: 'Россия, Белоруссия, Украина, администратор филиала, повар-сушист, повар-пиццмейкер, повар горячего цеха',
        perks: [],
      },
      {
        name: 'Трудовой договор',
        description: '',
        perks: ['#0066FF', '#8E9CBB'],
      },
      {
        name: 'Мед. книжка',
        description: '',
        perks: [],
      },
    ],
  }),
};

</script>

<style lang="scss" scoped>

.documents {
  user-select: none;

  &__title {
    font-size: 22px;
    font-weight: 500;
    line-height: 108%;
  }

  &__category + &__category {
    margin-top: -1px;
  }
}

</style>
