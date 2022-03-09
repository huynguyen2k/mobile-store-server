const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = `
			SELECT c.*, u.avatar, u.full_name
			FROM coupons c, user u
			WHERE c.user_id = u.id
		`

		db.query(query, (error, response) => {
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
		const query = 'SELECT * FROM coupons WHERE code = ?'
		db.query(query, [data.code], (error, response) => {
			if (error) throw error

			if (response.length >= 1) {
				return res.status(400).json({
					statusCode: 400,
					message: 'Mã code giảm giá đã tồn tại!',
				})
			}

			const query = 'INSERT INTO coupons SET ?'
			db.query(query, [data], (error, response) => {
				if (error) throw error

				res.json({
					statusCode: 200,
					message: 'Thêm mã giảm giá thành công!',
				})
			})
		})
	},

	update(req, res) {
		const { couponsId } = req.params
		const data = req.body

		const query = 'SELECT * FROM coupons WHERE id = ?'
		db.query(query, [couponsId], (error, response) => {
			if (error) throw error

			if (response.length === 0) {
				return res.status(404).json({
					statusCode: 404,
					message: 'Không tìm thấy mã giảm giá mà bạn muốn cập nhật!',
				})
			}

			if (response[0].used_quantity > 0) {
				return res.status(400).json({
					statusCode: 400,
					message: 'Không thể cập nhật mã giảm giá đã được sử dụng!',
				})
			}

			const query = 'UPDATE coupons SET ? WHERE id = ?'
			db.query(query, [data, couponsId], (error, response) => {
				if (error) throw error

				if (response.affectedRows > 0) {
					res.json({
						statusCode: 200,
						message: 'Cập nhật mã giảm giá thành công!',
					})
					return
				}

				res.status(404).json({
					statusCode: 404,
					message: 'Không tìm thấy mã giảm giá mà bạn muốn cập nhật!',
				})
			})
		})
	},

	delete(req, res) {
		const { couponsId } = req.params
		const query = 'DELETE FROM coupons WHERE id = ?'

		db.query(query, [couponsId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa mã giảm giá đã được sử dụng!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa mã giảm giá thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy mã giảm giá mà bạn muốn xóa!',
			})
		})
	},
}
