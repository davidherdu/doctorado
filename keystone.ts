import { config } from '@keystone-6/core';
import { lists } from './schema';
import { withAuth, session } from './security/auth';
import { rules } from './security/rules';

export default withAuth(
  config({
    /*db: {
      provider: 'mysql',
      url: 'mysql://doctorado:password123456@localhost:3310/doctorado',
      useMigrations: true,
    },*/
    db: {
      provider: 'postgresql',
      url: process.env.DATABASE_URL || 'postgres://doctorado:doctorado1234@localhost:5432/doctorado',
      useMigrations: true
    },
    //ui: { isAccessAllowed: rules.canManageUsers },
    lists,
    session: session,
  })
);
