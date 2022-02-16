const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = 'SELECT * FROM color_option'
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
		const { colorId } = req.params
		const query = 'SELECT * FROM color_option WHERE id = ?'

		db.query(query, [colorId], (error, response) => {
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
		const query = 'INSERT INTO color_option SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm cấu hình màu sắc thành công!',
			})
		})
	},

	update(req, res) {
		const { colorId } = req.params
		const data = req.body
		const query = 'UPDATE color_option SET ? WHERE id = ?'

		db.query(query, [data, colorId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật cấu hình màu sắc thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình màu sắc mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { colorId } = req.params
		const query = 'DELETE FROM color_option WHERE id = ?'

		db.query(query, [colorId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa cấu hình màu sắc này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa cấu hình màu sắc thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình màu sắc mà bạn muốn xóa!',
			})
		})
	},
}
