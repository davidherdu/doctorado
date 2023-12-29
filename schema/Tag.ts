import { list } from '@keystone-6/core';
import { allowAll } from '@keystone-6/core/access';

import {
	text,
	relationship,
} from '@keystone-6/core/fields';

export const Tag = list({

	access: allowAll,

	ui: {
		isHidden: true,
	},

	fields: {
		nombre: text(),
		// this can be helpful to find out all the Posts associated with a Tag
		notas: relationship({ ref: 'Nota.tags', many: true }),
	},
});
