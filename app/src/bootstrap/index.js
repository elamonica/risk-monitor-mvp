'use strict';

module.exports = async ({ strapi }) => {
  // Create default admin user if none exists
  const adminCount = await strapi.query('admin::user').count();
  
  if (adminCount === 0) {
    try {
      await strapi.admin.services.user.create({
        username: 'admin',
        email: 'admin@risk-monitor.com',
        password: 'password',
        firstname: 'Super',
        lastname: 'Admin',
        isActive: true,
        roles: [1], // Super admin role
      });
      
      strapi.log.info('Admin user created successfully');
    } catch (error) {
      strapi.log.error('Error creating admin user:', error);
    }
  }
};