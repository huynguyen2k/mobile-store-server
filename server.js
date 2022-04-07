require('dotenv').config()
const express = require('express')
const app = express()
const port = process.env.PORT || 3000

console.log(port)

// app.use(function (req, res, next) {
// 	res.header('Access-Control-Allow-Origin', '*')
// 	res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
// 	res.header('Access-Control-Allow-Headers', 'Content-Type')

// 	next()
// })

const cors = require('cors')
var whitelist = ['http://localhost:3000', 'http://localhost:19006']

const corsOptions = {
	origin: function (origin, callback) {
		if (whitelist.indexOf(origin) !== -1) {
			callback(null, true)
		} else {
			callback(new Error('Not allowed by CORS'))
		}
	},
	credentials: true, //access-control-allow-credentials:true
	optionSuccessStatus: 200,
}
app.use(cors(corsOptions))

app.use(express.static('public'))
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

const routes = require('./api/routes')
routes(app)

app.listen(port)

console.log('RESTful API server started on: ' + port)
