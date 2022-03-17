const db = require('../db')

module.exports = {
	getAll(req, res) {
		const { user_id } = req.query
		const query = 'SELECT * FROM user_address WHERE user_id = ?'
		db.query(query, [user_id], async (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	add(req, res) {
		const data = req.body
		const query = 'SELECT * FROM user_address WHERE user_id = ?'
		db.query(query, [data.user_id], async (error, response) => {
			if (error) throw error

			if (response.length === 0) {
				data.is_default = true
			}

			if (response.length > 0 && data.is_default) {
				const query = 'UPDATE user_address SET ? WHERE user_id = ?'
				db.query(
					query,
					[{ is_default: false }, data.user_id],
					(error, response) => {
						if (error) throw error

						const query = 'INSERT INTO user_address SET ?'
						db.query(query, [data], (error, response) => {
							if (error) throw error

							res.json({
								statusCode: 200,
								message: 'Thêm địa chỉ khách hàng thành công!',
							})
						})
					}
				)
				return
			}

			const query = 'INSERT INTO user_address SET ?'
			db.query(query, [data], (error, response) => {
				if (error) throw error

				res.json({
					statusCode: 200,
					message: 'Thêm địa chỉ khách hàng thành công!',
				})
			})
		})
	},

	update(req, res) {
		const { addressId } = req.params
		const data = req.body

		if (data.is_default) {
			const query = 'UPDATE user_address SET ? WHERE user_id = ?'
			db.query(
				query,
				[{ is_default: false }, data.user_id],
				(error, response) => {
					if (error) throw error

					const query = 'UPDATE user_address SET ? WHERE id = ?'
					db.query(query, [data, addressId], (error, response) => {
						if (error) throw error

						if (response.affectedRows > 0) {
							res.json({
								statusCode: 200,
								message: 'Cập nhật địa chỉ khách hàng thành công!',
							})
							return
						}

						res.status(404).json({
							statusCode: 404,
							message:
								'Không tìm thấy địa chỉ khách hàng mà bạn muốn cập nhật!',
						})
					})
				}
			)
			return
		}

		const query = 'UPDATE user_address SET ? WHERE id = ?'
		db.query(query, [data, addressId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật địa chỉ khách hàng thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy địa chỉ khách hàng mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { addressId } = req.params
		const query = 'DELETE FROM user_address WHERE id = ?'

		db.query(query, [addressId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa địa chỉ này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa địa chỉ thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy địa chỉ mà bạn muốn xóa!',
			})
		})
	},
}
