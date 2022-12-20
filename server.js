const express = require('express')
const app = express()
const path = require('path')
const PORT = process.env.port || 4000

// serve static file directory
app.use(express.static(__dirname +'/frontend'));

// point to root domain
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '/frontend/index.html'));
})

// use this to catch all routes
app.use('/*', (req, res) => {
  res.sendFile(path.join(__dirname, '/frontend/index.html'));
})

app.listen(PORT, () => {
  console.log(`base-dtoo server listening on port ${PORT}`)
})
