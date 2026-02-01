const jwt = require('jsonwebtoken');
const { JWT_SECRET } = require('../config/secrets/jwt.secret.js');

async function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({ message: 'Unauthorized: Missing or invalid token', token: authHeader });
    }

    const token = authHeader.substring(7); // Remove 'Bearer ' prefix

    try {

        const decoded = await jwt.verify(token, JWT_SECRET);
        req.user = decoded;
        next();

    } catch (err) {
        return res.status(403).json({ message: 'Try-catch block error at authenticate middleware, Forbidden: Invalid token', error: err.message });
    }
}

module.exports = authenticateToken;