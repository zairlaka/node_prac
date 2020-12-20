const net = require('net');
const server = net.createServer();

server.listen({
    host: 'localhost',
    port: 8080
});

const connectedClients = [];
server.on('connection', (client) => {// client in parameter is reference of client that connect to 8080 port
    console.log('Client connected');
    client.write('welcome to the port: 8080');// so we have to write event listener in client side too.
    connectedClients.push(client);
});

setInterval(() => {
    const now = new Date().toDateString();
    connectedClients.forEach(client => {
        client.write(now);
    });
}, 5000);