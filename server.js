const app = require('./src/app');

const PORT = 3000;
const IP_BIND = '0.0.0.0'

const server = app.listen(PORT, IP_BIND, () => {
    console.log('Server is running on port 3000');
});


// Graceful shutdown handling
process.on('SIGTERM', gracefulShutdown);
process.on('SIGINT', gracefulShutdown);

function gracefulShutdown() {
    console.log('Received shutdown signal, shutting down gracefully...');
    server.close(() => {
        console.log('Closed out remaining connections.');
        process.exit(0);
    });
    // If after 10 seconds, forcefully shut down
    setTimeout(() => {
        console.error('Could not close connections in time, forcefully shutting down');
        process.exit(1);
    }, 10000);
}

process.on('uncaughtException', (err) => {
    console.error('Uncaught Exception:', err);
    gracefulShutdown();
});

process.on('unhandledRejection', (reason, promise) => {
    console.error('Unhandled Rejection at:', promise, 'reason:', reason);
    gracefulShutdown();
});