const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const pool = require('../../config/db.config.js');

const { JWT_SECRET, JWT_EXPIRES_IN } = require('../../config/secrets/jwt.secret.js');

const router = express.Router();

router.post('/login', async (req, res) => {

    //1. fetch user credentials from request body
    const { username, password } = req.body;
    try {
        //Administartive access :
        if (username === 'admin' && password === 'admin@123') {
            const token = jwt.sign(
                {
                    sub: 'admin_id',
                    username: 'admin',
                    role: 'admin'
                },
                JWT_SECRET,
                {
                    expiresIn: JWT_EXPIRES_IN
                }
            );
            return res.status(200).json({
                alert_msg: 'Admin login successful',
                message: 'Admin login successful',
                token: token
            });
        }

        //2. check if user exists in database
        const user = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
        if (user.rows.length === 0) {
            return res.status(401).json({ message: 'Invalid username or password' });
        }
        const hashedPassword = user.rows[0].password;
        const isPasswordValid = await bcrypt.compare(password, hashedPassword);

        if (!isPasswordValid) {
            return res.status(401).json({ message: 'Invalid username or password' });
        }
        //3. generate JWT token
        const token = jwt.sign(
            {
                sub: user.rows[0].id,
                username: user.rows[0].username,
                role: user.rows[0].user_role
            },
            JWT_SECRET,
            {
                expiresIn: JWT_EXPIRES_IN
            }
        )
        //4. send response with token
        res.setHeader('Authorization', `Bearer ${token}`);

        return res.status(200).json({
            alert_msg: 'Login successful',
            message: 'Login successful',
            token: token

        });

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error', error: error.message });
    }
});



module.exports = router;