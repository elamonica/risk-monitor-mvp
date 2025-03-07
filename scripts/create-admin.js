// create-admin.js
module.exports = async () => {
  try {
    // Check if there is already an admin user to avoid duplicates
    const existingAdmin = await strapi.admin.services.user.findOne({
      email: 'admin@risk-monitor.com',
    });

    if (existingAdmin) {
      console.log('Admin user already exists');
      return;
    }

    // Create the admin user
    await strapi.admin.services.user.create({
      username: 'admin',
      email: 'admin@risk-monitor.com',
      password: 'password',
      firstname: 'Super',
      lastname: 'Admin',
      isActive: true,
      roles: [1], // Super admin role
    });

    console.log('Admin user created successfully');
  } catch (error) {
    console.error('Error creating admin user:', error);
  }
};