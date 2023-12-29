import { list } from '@keystone-6/core';
import { isAdmin } from '../security/rules';

import {
  text,
  relationship,
  integer,
  select,
  timestamp
} from '@keystone-6/core/fields';

export const Bibliografia = list({
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
      initialColumns: ['autor', 'titulo', 'fuente'],
    }
  },
  fields: {
    autor: text(),
    titulo: text(),
    anio: integer({
      label: 'Año',
    }),
    fuente: text(),
    paginas: text(),
    tipo: select({
      options: [
        { label: 'Libro', value: 'libro' },
        { label: 'Revista', value: 'revista' },
      ],
      defaultValue: 'draft',
      ui: { displayMode: 'segmented-control' },
      validation: { isRequired: true },
    }),

    // with this field, you can set a User as the author for a Post
    /*author: relationship({
      // we could have used 'User', but then the relationship would only be 1-way
      ref: 'User.posts',

      // this is some customisations for changing how this will look in the AdminUI
      ui: {
        displayMode: 'cards',
        cardFields: ['name', 'email'],
        inlineEdit: { fields: ['name', 'email'] },
        linkToItem: true,
        inlineConnect: true,
      },

      // a Post can only have one author
      //   this is the default, but we show it here for verbosity
      many: false,
    }),*/

    // with this field, you can add some Tags to Posts
    notas: relationship({
      // we could have used 'Tag', but then the relationship would only be 1-way
      ref: 'Nota.bibliografia',

      // a Post can have many Tags, not just one
      many: true,

      // this is some customisations for changing how this will look in the AdminUI
      /*ui: {
        displayMode: 'cards',
        cardFields: ['nombre'],
        inlineEdit: { fields: ['nombre'] },
        linkToItem: true,
        inlineConnect: true,
        inlineCreate: { fields: ['name'] },
      },*/
    }),
    createdAt: timestamp({
      defaultValue: { kind: 'now' },
    }),
  },
});
