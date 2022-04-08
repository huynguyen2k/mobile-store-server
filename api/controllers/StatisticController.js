const db = require('../db')

module.exports = {
	async getAll(req, res) {
		const result = {}
		const promiseList = []

		promiseList.push(
			new Promise((resolve, reject) => {
				const query = 'SELECT * FROM brand'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_brand = response.length
					resolve()
				})
			})
		)

		promiseList.push(
			new Promise((resolve, reject) => {
				const query = 'SELECT * FROM product'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_product = response.length
					resolve()
				})
			})
		)

		promiseList.push(
			new Promise((resolve, reject) => {
				const query = 'SELECT * FROM `order`'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_order = response.length
					resolve()
				})
			})
		)

		promiseList.push(
			new Promise((resolve, reject) => {
				const query = 'SELECT * FROM user WHERE role_id = 4'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_customer = response.length
					resolve()
				})
			})
		)

		promiseList.push(
			new Promise((resolve, reject) => {
				const query = 'SELECT * FROM user WHERE role_id != 4'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_staff = response.length
					resolve()
				})
			})
		)

		promiseList.push(
			new Promise((resolve, reject) => {
				const query =
					'SELECT SUM(total_price) as total_price FROM `order` WHERE status_id = 6'
				db.query(query, (error, response) => {
					if (error) throw error

					result.total_price = response[0].total_price
					resolve()
				})
			})
		)

		await Promise.all(promiseList)

		res.json({
			statusCode: 200,
			message: 'Xử lý thành công!',
			content: result,
		})
	},

	getTotalPrice(req, res) {
		const { start, end } = req.query
		const query = `
			SELECT SUM(total_price) as total_price 
			FROM \`order\` WHERE status_id = 6 AND
			created_date >= ? AND created_date <= ?
		`
		db.query(query, [start, end], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response[0].total_price ?? 0,
			})
		})
	},
}
