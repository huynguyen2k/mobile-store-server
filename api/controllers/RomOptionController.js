const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = 'SELECT * FROM rom_option'
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
		const { romId } = req.params
		const query = 'SELECT * FROM rom_option WHERE id = ?'

		db.query(query, [romId], (error, response) => {
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
		const query = 'INSERT INTO rom_option SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm cấu hình rom thành công!',
			})
		})
	},

	update(req, res) {
		const { romId } = req.params
		const data = req.body
		const query = 'UPDATE rom_option SET ? WHERE id = ?'

		db.query(query, [data, romId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật cấu hình rom thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình rom mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { romId } = req.params
		const query = 'DELETE FROM rom_option WHERE id = ?'

		db.query(query, [romId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa cấu hình rom này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa cấu hình rom thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình rom mà bạn muốn xóa!',
			})
		})
	},
}
