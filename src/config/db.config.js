
import { Pool } from 'pg';

const pool = new Pool({
    user: 'postgres',
    password: "1234",
    database: 'vgpl_ems_backend',
    port: 5432,
    host: 'localhost',
    timezone: 'Asia/Kolkata'

})

// pool.query('SELECT NOW()', (err, result) => {
//     if(err){
//         console.error('Database Connection error:', err)
//     }

//     else {
//         console.log('Connected to PostgresSQL...!', result.rows[0].now);
//     }


// })

export default pool;