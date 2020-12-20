// We will also create an external JavaScript file to execute a PUT request. According to Express conventions, this JavaScript is kept in a folder called public

// Then, we have to tell Express to make this public folder accessible to the public by using a built-in middleware called express.static

const update = document.querySelector('#update-button')
update.addEventListener('click', _ => {
    //send put request here 
    //Sending a PUT Request The easiest way to trigger a PUT request in modern browsers is to use the Fetch API.
    //fetch(endpoint, options)
    fetch('/quotes', {
        method: 'put',
        headers: { 'Content-Type': 'application/json' },// to tell the server we're sending JSON data by setting this
        body: JSON.stringify({
          name: 'Darth Vadar',
          quote: 'I find your lack of faith disturbing.'
        })
    })
})