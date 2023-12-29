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
		// this can be helpful to find out all the Posts associated with a Tag
		bibliografia: relationship({ ref: 'Bibliografia.notas', many: false }),
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
		// with this field, you can add some Tags to Posts
		tags: relationship({
			// we could have used 'Tag', but then the relationship would only be 1-way
			ref: 'Tag.notas',

			// a Post can have many Tags, not just one
			many: true,

			// this is some customisations for changing how this will look in the AdminUI
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
