const express = require('express');
const bcrypt = require('bcrypt');
const pool = require('../../config/db.config.js');
const router = express.Router();

router.post('/signup', async (req, res) => {
    const { username, password, user_role } = req.body;
    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = await pool.query(
            'INSERT INTO users (username, password, user_role) VALUES ($1, $2, $3) RETURNING *',
            [username, hashedPassword, user_role]
        );
        res.status(201).json({ message: 'User created successfully', user: newUser.rows[0] });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal server error', error: error.message });
    }
})

module.exports = router;