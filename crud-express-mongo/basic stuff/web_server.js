const http = require('http');
const server = http.createServer(
    (req,res) => {
        //http takes two argument
        res.writeHead(200, {'content-type': 'text/html'});

        const cin = req.url.slice(1);
        res.end(`<h1>Hello http server ${cin}</h1>`);
    }
)

server.listen(8080, 'localhost');
//run the file and go to browser and enter localhost:8080
