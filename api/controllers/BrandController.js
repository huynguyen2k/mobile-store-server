const db = require('../db')

module.exports = {
	getAll(req, res) {
		const { published } = req.query
		const query = `SELECT * FROM brand ${
			published === undefined ? '' : `WHERE published = ${published}`
		}`

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
		const { brandId } = req.params
		const query = 'SELECT * FROM brand WHERE id = ?'

		db.query(query, [brandId], (error, response) => {
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
		const query = 'INSERT INTO brand SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm thương hiệu thành công!',
			})
		})
	},

	update(req, res) {
		const { brandId } = req.params
		const data = req.body
		const query = 'UPDATE brand SET ? WHERE id = ?'

		db.query(query, [data, brandId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật thương hiệu thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thương hiệu mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { brandId } = req.params
		const query = 'DELETE FROM brand WHERE id = ?'

		db.query(query, [brandId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa thương hiệu đã có sản phẩm!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa thương hiệu thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thương hiệu mà bạn muốn xóa!',
			})
		})
	},
}
