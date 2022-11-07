<template>
  <div class="documents">
    <div class="documents__header">
      <div class="documents__title">
        Документы
      </div>
      <div class="documents__buttons">
        <TopButtons />
      </div>
    </div>
    <div class="documents__search">
      <SearchInput v-model="searchQuery" />
    </div>
    <div class="documents__content">
      <v-draggable
        :list="categories"
        handle=".drag-handle"
        group="categories"
        animation="250"
        :disabled="isSearching"
      >
        <div
          v-for="(category, categoryIndex) in actualCategories"
          :key="`cat_${categoryIndex}`"
          class="documents__category"
        >
          <Category
            :category="category"
            :auto-expand="category.documents.length > 0"
          >
              <v-draggable
                :list="category.documents"
                handle=".drag-handle"
                group="documents"
                animation="250"
                :disabled="isSearching"
              >
                <div
                  v-for="(document, documentIndex) in category.documents"
                  class="documents__item"
                  :key="`doc_${documentIndex}`"
                >
                  <Item
                    :document="document"
                    :required="category.required"
                  />
                </div>
              </v-draggable>
          </Category>
        </div>
      </v-draggable>
      <div class="documents__uncategorized">
        <v-draggable
          :list="uncategorizedDocuments"
          handle=".drag-handle"
          group="documents"
          animation="250"
          :disabled="isSearching"
        >
          <div
            class="documents__item"
            v-for="(document, documentIndex) in uncategorizedDocuments"
            :key="`doc_${documentIndex}`"
          >
            <Item :document="document" />
          </div>
        </v-draggable>
      </div>
    </div>
  </div>
</template>

<script>

import deepcopy from 'deepcopy';

import TopButtons from './TopButtons.vue';
import SearchInput from './SearchInput.vue';
import Category from './DocumentCategory.vue';
import Item from './DocumentItem.vue';

export default {
  name: 'TheDocuments',
  components: {
    TopButtons,
    SearchInput,
    Category,
    Item,
  },
  data: () => ({
    searchQuery: '',
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
    clonedCategories: null,
  }),
  computed: {
    isSearching() {
      return this.searchQuery.length > 1;
    },
    searchedTree() {
      if (!this.isSearching) {
        return this.categories;
      }

      const result = [];
      const queryRegExp = new RegExp(this.searchQuery, 'i');

      this.clonedCategories.forEach((category) => {
        if (category.name.search(queryRegExp) !== -1) {
          result.push(category);
        } else {
          category.documents.forEach((document) => {
            let includedCategory = null;

            if (document.name.search(queryRegExp) !== -1) {
              if (!includedCategory) {
                includedCategory = category;
                includedCategory.documents = [];
              }

              includedCategory.documents.push(document);
            }

            if (includedCategory) {
              result.push(includedCategory);
            }
          });
        }
      });

      return result;
    },
    actualCategories() {
      if (this.isSearching) {
        return this.searchedTree;
      }

      return this.categories;
    },
  },
  watch: {
    isSearching(yes) {
      if (yes) {
        this.cloneCategories();

        return;
      }

      this.clonedCategories = null;
    },
  },
  mounted() {
    this.cloneCategories();
  },
  methods: {
    cloneCategories() {
      this.clonedCategories = deepcopy(this.categories);
    },
  },
};

</script>

<style lang="scss" scoped>

.documents {
  user-select: none;

  &__header {
    display: flex;
    align-items: center;
  }

  &__title {
    font-size: 22px;
    font-weight: 500;
    line-height: 108%;
  }

  &__buttons {
    margin-left: auto;
  }

  &__search {
    max-width: 546px;
    margin: 20px 0;
  }

  &__content {
    max-width: 1190px;
  }

  &__category + &__category {
    margin-top: -1px;
  }

  &__item {
    margin-top: -1px;
  }

  &__uncategorized {
    margin-top: 15px;
  }

  .sortable-ghost {
    background-color: rgba(0, 102, 255, 0.15);
  }
}

</style>
