import { list } from '@keystone-6/core';
import { isAdmin, rules } from '../security/rules';

import {
	text,
	password,
	timestamp,
	checkbox
} from '@keystone-6/core/fields';

export const User = list({
	access: {
		operation: {
			query: isAdmin,
			create: isAdmin,
			update: isAdmin,
			delete: isAdmin,
		},
		filter: {
			query: rules.canManageUsers
		}
	},
	ui: {
		listView: {
			initialColumns: ['name', 'email', 'isAdmin'],
		},
		labelField: 'email',
	},
	fields: {
		name: text({ validation: { isRequired: true } }),
		email: text({
			validation: { isRequired: true },
			isIndexed: 'unique',
		}),
		password: password({ validation: { isRequired: true } }),
		isAdmin: checkbox({
			access: {
				read: isAdmin,
				create: isAdmin,
				update: isAdmin,
			},
		}),
		createdAt: timestamp({
			defaultValue: { kind: 'now' },
		}),
	},
});
