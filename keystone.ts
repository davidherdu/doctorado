import { config } from '@keystone-6/core';
import { lists } from './schema';
import { withAuth, session } from './security/auth';
import { rules } from './security/rules';

export default withAuth(
  config({
    db: {
      provider: 'mysql',
      url: 'mysql://doctorado:password123456@localhost:3310/doctorado',
      useMigrations: true,
      // shadowDatabaseUrl: 'mysql://doctorado:password123456@localhost:3310/shadowdb'
    },
    //ui: { isAccessAllowed: rules.canUseAdminUI },
    lists,
    session: session,
  })
);
