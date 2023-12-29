import { KeystoneContext } from '@keystone-6/core/types';

type SessionContext = {
	session?: {
		data: {
			name: string
			isAdmin: boolean
		}
		itemId: string
		listKey: string
	}
	context: KeystoneContext
}

export function isAdmin({ session }: SessionContext) {
	return !!session && session.data.isAdmin
}

export function isSignedIn({ session }: SessionContext) {
	return !!session
}

export const rules = {
	canUseAdminUI: ({ session }: SessionContext) => {
		return isAdmin({ session })
	},
	canManageUsers: ({ session }: SessionContext) => {
		if (!isSignedIn({ session })) {
			return false
		}

		if (isAdmin({ session })) {
			return true
		}

		return { id: { equals: session.itemId } }
	},
}
