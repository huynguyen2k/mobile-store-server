const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = 'SELECT * FROM ram_option'
		db.query(query, async (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	get(req, res) {
		const { ramId } = req.params
		const query = 'SELECT * FROM ram_option WHERE id = ?'

		db.query(query, [ramId], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response.length === 0 ? null : response[0],
			})
		})
	},

	add(req, res) {
		const data = req.body
		const query = 'INSERT INTO ram_option SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm cấu hình ram thành công!',
			})
		})
	},

	update(req, res) {
		const { ramId } = req.params
		const data = req.body
		const query = 'UPDATE ram_option SET ? WHERE id = ?'

		db.query(query, [data, ramId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật cấu hình ram thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình ram mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { ramId } = req.params
		const query = 'DELETE FROM ram_option WHERE id = ?'

		db.query(query, [ramId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa cấu hình ram này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa cấu hình ram thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình ram mà bạn muốn xóa!',
			})
		})
	},
}
