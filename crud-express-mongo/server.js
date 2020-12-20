console.log('server.js file is running');

const express = require('express');
const bodyParser = require('body-parser');
const app = express();

// we need to create server that browser can connect to.
app.listen(3000, function() {
    console.log('listening on 3000')
})
// now run this and hit localhost:3000 that say cannot GET/
// browser perform the read operation when you visit a website 
// under the hood, they send a GET request to the server to perform this read operation

//[][] app.get(endpoint,callback);
// endpoint is the requested endpoint. It’s the value that comes after your domain name
// like google.com/shit but here localhost:3000/ so browser requested for /

// callback tells the server what to do when the requested endpoint matches the endpoint stated.
// It takes two arguments: A request object and a response object.

// so lets tell the browser what to do on /


//now rather then a text we want to server up a index.html
//to do this, we use the sendFile method that provided by the res object

// app.get('/', (req,res) => {
//     //console.log('working')
//     //res.send('i am gRoot')
//     res.sendFile(__dirname + '/index.html');
// })
//This is how Express handles a GET request (READ operation) in a nutshell.

// Make sure you place body-parser before your CRUD handlers!
app.use(bodyParser.urlencoded({ extended: true }))
//The urlencoded method within body-parser tells body-parser to extract data from the <form> element and add them to the body property in the request object.

const MongoClient = require('mongodb').MongoClient

connectionString =  "mongodb+srv://root:proadmin@zaircluster.gj8gd.mongodb.net/node_basic_crud?retryWrites=true&w=majority"

MongoClient.connect(connectionString, { useUnifiedTopology: true })
  .then(client => {
    console.log('Connected to Database')
    const db = client.db('node_basic_crud')
    const quotesCollection = db.collection('quotes')
    // app.use(/* ... */)
    // app.get(/* ... */)
    // app.post(/* ... */)
    // app.listen(/* ... */)


    app.set('view engine', 'ejs')
    //Next, we need to set view engine to ejs. This tells Express we’re using EJS as the template engine. You can need to place it before any app.use, app.get or app.post methods.
    app.post('/quotes', (req,res) => {
        console.log('working')
        console.log(req.body)
        // { name: 'umer', quote: 'love from pakistan' } u will see log when you submit form through index.html
        //res.sendFile(__dirname + '/index.html');
        quotesCollection.insertOne(req.body)
        .then(result => {
          console.log(result)
          console.log("save into db")
          res.redirect('/')
        })
        .catch(error => console.error(error))
    })
    app.use(express.static('public'))
    app.get('/',(req,res) => {
      const cursor = db.collection('quotes').find().toArray()
      .then(results => {
        //console.log(results) //giving me a array 
        // res.render(view, locals)
        //view is the name of the file we're rendering. this file must be placed inside a views folder.
        //locals is the data passed into the file.
        res.render('index.ejs', { quotes: results})
      })
      .catch(error => console.error(error))
    })

    // We will also create an external JavaScript file to execute a PUT request. According to Express conventions, this JavaScript is kept in a folder called public
    
    //Then, we have to tell Express to make this public folder accessible to the public by using a built-in middleware called express.static

    app.use(bodyParser.json())
    app.put('/quotes',(req, res) => {
      // MongoDB Collections come with a method called findOneAndUpdate

      console.log(req.body)
    })
    
  })
  .catch(console.error)

// https://api.uptimerobot.com/v2/methodName?api_key=YOUR_API_KEY_HERE


