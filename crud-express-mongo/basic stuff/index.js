console.log('Hello Node.js!') 

//const fs = require('fs')   
//fs.writeFileSync('notes.txt', 'I live in Philadelphia') 

const checkUtils = require('./utils.js') 
 
checkUtils() 


const name = process.env.USERNAME;
console.log(`Hello ${name}`)

// this is custom command prompt 
console.log(process.argv); // [ 'C:\\Program Files\\nodejs\\node.exe', 'E:\\node prac\\index.js' ]

const argument = process.argv.slice(2)
const sum = argument.reduce((acc,val) => acc + parseInt(val),0)
console.log(sum)

//##### -===== os module & evironment
//use built in module for getting system information and setup our evironment variable like DATABASE_PASSWORD
//in utils.js


//##### -===== File system
// play with fs module to create read write copy or delete files from system with the help of js
//in utils.js

//##### -===== Events
//use event module to create triggers like events
//for example whenever we save our specific file we get log message 'File has change'
// in utils.js

//##### -===== Net & HTTP module networking request 
// code in server.js and client.js 
// 1. we create a server on a 8080 port and then client connect to that port using Net module
// and server send message with current time to every client connected to that server
// and make http server with request and response localhost:8080
// in web_server

//##### -===== DNS module

const dns = require('dns');

dns.lookup('google.com', (value, error) => {
    if (error){
        console.log(error);
        return;
    }
    console.log(value);
});
// you can use resolve in place of lookup which made a network request and return all the ip's addresses that belongs to that ip
// give it addition argument to 'MX' for mail exchange info next to domain
// and user reverse function to get domain out of ip like 8.8.8.8

//##### -===== Handing errors
// the function that take two  argument error and value do not respond to try catch block you have to put if condition and handle error there  


//##### -===== streams
// streams handle data from i/o opration it just a collection data sequence of character array or even objects
// useful when dealing with async i/o oprations like net and http so instead of reading whole file at once we should read as stream bit by bit