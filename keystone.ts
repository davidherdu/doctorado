import { config } from '@keystone-6/core';
import { lists } from './schema';
import { withAuth, session } from './security/auth';
import { rules } from './security/rules';

export default withAuth(
  config({
    /*server: {
      cors: {
        origin: [...process.env.CORS_WHITELIST.split(',')],
        credentials: true,
      }
    },*/
    /*db: {
      provider: 'mysql',
      url: 'mysql://doctorado:password123456@localhost:3310/doctorado',
      useMigrations: true,
    },*/
    db: {
      provider: 'postgresql',
      url: process.env.DATABASE_URL || 'postgres://doctorado:doctorado1234@localhost/doctorado',
      useMigrations: true
    },
    ui: { isAccessAllowed: rules.canUseAdminUI },
    lists,
    session: session,
  })
);
