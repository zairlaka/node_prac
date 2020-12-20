const check = function () {     
    console.log('utils.js Doing some work...') 
    console.log('npm install -g nodemon@1.18.5') 
    console.log('nodemon app.js ') 
} 
 
module.exports = check 
//The value stored on module.exports will be the return value for require when the script is imported.
// That means other scripts could load in the utilities to access the check function

//##### -===== os module & evironment

const os = require('os');
console.log(os.userInfo());
/* return {
  uid: -1,
  gid: -1,
  username: 'Notebook',
  homedir: 'C:\\Users\\Notebook',
  shell: null
}
*/
//console.log(os.userInfo()); //gives you os platform name .e.g. win23
//console.log(os.release()); // gives you os version 

//console.log(os.cpus()); // gives info about your cpus

console.log(__dirname); //E:\node prac
console.log(__filename); //E:\node prac\utils.js

//console.log(process.env); 
// to add your env variable run below line in comand line
// export DATABASE_PASSWORD=rootadmin
// console.log(process.env.DATABASE_PASSWORD)


//##### -===== File system
const fs = require('fs');

fs.writeFileSync('new.txt','Hello Node');
fs.appendFileSync('new.txt','Append Node'); // for copy jsut use copyFileSync
fs.renameSync('new.txt','old.txt')

const content = fs.readFileSync('old.txt');
console.log(content.toString()); // without converting this gives you buffer

fs.unlinkSync('old.txt'); // to delete a file 

//##### -===== Events

const e = require('events');
let usersLoggedIn = 0;

const eventEmitter = new e.EventEmitter();
eventEmitter.on('userLoggedInEvent', () =>{
    usersLoggedIn += 1;
    console.log(`There are ${usersLoggedIn} users logged in`);
});

eventEmitter.emit('userLoggedInEvent');

//for log the msg when ever changing in file
// const fsw = require('fs');
// const watcher = fs.watch('utils.js');
// // file system watch function itself emmit several diffrent event 
// // one of which is change

// console.log("program is waiting ..... change and save to the file.")
// watcher.on('change', () => {
//     console.log('File has change');
// })

