import { list } from '@keystone-6/core';
import { isAdmin } from '../security/rules';

import {
  integer,
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
    pagina: integer(),
    bibliografia: relationship({
      ref: 'Bibliografia.notas',
      many: false,
      ui: {
        hideCreate: true,
        displayMode: 'cards',
        cardFields: ['titulo'],
        linkToItem: true,
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
        cardFields: ['nombre'],
        inlineEdit: { fields: ['nombre'] },
        linkToItem: true,
        inlineConnect: true,
        inlineCreate: { fields: ['nombre'] },
      },
    }),
    createdAt: timestamp({
      defaultValue: { kind: 'now' },
    }),
  },
});
