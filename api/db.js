const mysql = require('mysql')

const db = mysql.createConnection({
	host: process.env.DB_HOST || 'localhost',
	user: process.env.DB_USER || 'root',
	password: process.env.DB_PASS || '',
	database: process.env.DB_NAME || 'mobile-store',
	timezone: 'Asia/Ho_Chi_Minh',
})

module.exports = db
