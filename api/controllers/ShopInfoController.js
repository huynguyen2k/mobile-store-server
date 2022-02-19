const db = require('../db')

module.exports = {
	get(req, res) {
		const query = 'SELECT * FROM shop_info'
		db.query(query, async (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response[0],
			})
		})
	},

	update(req, res) {
		const { shopId } = req.params
		const data = req.body
		const query = 'UPDATE shop_info SET ? WHERE id = ?'
		db.query(query, [data, shopId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật thông tin cửa hàng thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thông tin cửa hàng mà bạn muốn cập nhật!',
			})
		})
	},
}
