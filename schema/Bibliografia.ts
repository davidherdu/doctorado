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
    notas: relationship({ ref: 'Nota.bibliografia', many: true }),
    createdAt: timestamp({
      defaultValue: { kind: 'now' },
    }),
  },
});
