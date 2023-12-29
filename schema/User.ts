import { list } from '@keystone-6/core';
import { allowAll } from '@keystone-6/core/access';

import {
	text,
	password,
	timestamp,
} from '@keystone-6/core/fields';

export const User = list({
	access: allowAll,

	fields: {
		name: text({ validation: { isRequired: true } }),

		email: text({
			validation: { isRequired: true },
			// by adding isIndexed: 'unique', we're saying that no user can have the same
			// email as another user - this may or may not be a good idea for your project
			isIndexed: 'unique',
		}),

		password: password({ validation: { isRequired: true } }),

		createdAt: timestamp({
			// this sets the timestamp to Date.now() when the user is first created
			defaultValue: { kind: 'now' },
		}),
	},
});
