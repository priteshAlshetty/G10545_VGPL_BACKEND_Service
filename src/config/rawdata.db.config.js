// switched to CommonJS export for compatibility
const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    password: '1234',
    database: 'vgpl_ems_data_logger',
    port: 5432,
    host: 'localhost',
    timezone: 'Asia/Kolkata'
});

// pool.query('SELECT NOW()', (err, result) => {
//     if (err) {
//         console.error('Database Connection error:', err);
//     } else {
//         console.log('Connected to PostgresSQL...!', result.rows[0].now);
//     }
// });

module.exports = pool;