import { list } from '@keystone-6/core';
import { isAdmin } from '../security/rules';

import {
  text,
  relationship,
  timestamp
} from '@keystone-6/core/fields';

export const Tag = list({
  access: {
    operation: {
      query: isAdmin,
      create: isAdmin,
      update: isAdmin,
      delete: isAdmin,
    },
  },
  ui: {
    isHidden: true,
  },
  fields: {
    nombre: text(),
    notas: relationship({ ref: 'Nota.tags', many: true }),
    createdAt: timestamp({
      defaultValue: { kind: 'now' },
    }),
  },
});
