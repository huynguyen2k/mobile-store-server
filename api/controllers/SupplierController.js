const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = 'SELECT * FROM supplier'

		db.query(query, async (error, response) => {
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
		const query = 'INSERT INTO supplier SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm nhà cung cấp thành công!',
			})
		})
	},

	update(req, res) {
		const { supplierId } = req.params
		const data = req.body
		const query = 'UPDATE supplier SET ? WHERE id = ?'

		db.query(query, [data, supplierId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật nhà cung cấp thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy nhà cung cấp mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { supplierId } = req.params
		const query = 'DELETE FROM supplier WHERE id = ?'

		db.query(query, [supplierId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa nhà cung cấp này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa nhà cung cấp thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy nhà cung cấp mà bạn muốn xóa!',
			})
		})
	},
}
