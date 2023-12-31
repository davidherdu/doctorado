import { list } from '@keystone-6/core';
import { isAdmin } from '../security/rules';

import {
  text,
  relationship,
  timestamp
} from '@keystone-6/core/fields';

import { document } from '@keystone-6/fields-document';

export const Nota = list({
  access: {
    operation: {
      query: isAdmin,
      create: isAdmin,
      update: isAdmin,
      delete: isAdmin,
    },
  },
  ui: {
    listView: {
      initialColumns: ['nota', 'tags'],
    }
  },
  fields: {
    paginas: text(),
    bibliografia: relationship({
      ref: 'Bibliografia.notas',
      many: false,
      ui: {
        hideCreate: true,
        displayMode: 'cards',
        cardFields: ['titulo'],
        inlineEdit: { fields: ['titulo'] },
        linkToItem: true,
        inlineConnect: true,
      },
    }),
    nota: document({
      formatting: true,
      layouts: [
        [1, 1],
        [1, 1, 1],
        [2, 1],
        [1, 2],
        [1, 2, 1],
      ],
      links: true,
      dividers: true,
    }),
    tags: relationship({
      ref: 'Tag.notas',
      many: true,
      ui: {
        displayMode: 'cards',
        cardFields: ['palabra'],
        inlineEdit: { fields: ['palabra'] },
        linkToItem: true,
        inlineConnect: true,
        inlineCreate: { fields: ['palabra'] },
      },
    }),
    createdAt: timestamp({
      defaultValue: { kind: 'now' },
    }),
  },
});
