'use strict';

module.exports = async ({ strapi }) => {
  // Create default admin user if none exists
  const adminCount = await strapi.query('admin::user').count();
  
  if (adminCount === 0) {
    try {
      const superAdminRole = await strapi.query('admin::role').findOne({
        where: { code: 'strapi-super-admin' }
      });
      
      await strapi.admin.services.user.create({
        username: 'admin',
        email: 'admin@risk-monitor.com',
        password: 'password',
        firstname: 'Super',
        lastname: 'Admin',
        isActive: true,
        roles: [superAdminRole.id],
      });
      
      strapi.log.info('Admin user created successfully');
    } catch (error) {
      strapi.log.error('Error creating admin user:', error);
    }
  }
};