const express = require('express');
const app = express();
const cors = require('cors');
//import routes
const loginRoute = require('./routes/auth/login.route.js');
const signupRoute = require('./routes/auth/signup.route.js');
const rawDataRoute = require('./routes/info/rawdata.routes.js');
//middleware
const authenticateToken = require('./middleware/auth.middleware.js');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));



//
app.use('/api/ems/processeddata', rawDataRoute);
//use routes outside of middleware
//unprotected routes
app.use('/', loginRoute);

//middleware to protect routes
app.use(authenticateToken);

//protected routes
app.use('/', signupRoute);


app.get('/', (req, res) => {
    res.send('VGPL Backend is running !!');
});

module.exports = app;