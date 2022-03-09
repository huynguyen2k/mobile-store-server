const db = require('../db')
const fs = require('fs')

module.exports = {
	getAll(req, res) {
		const { published } = req.query
		const query = `
			SELECT n.*, u.avatar, u.full_name
			FROM notification n, user u
			WHERE n.user_id = u.id
      ${published === undefined ? '' : ` AND n.published = ${published}`}
      ORDER BY n.created_date DESC
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
		const query = 'INSERT INTO notification SET ?'
		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm thông báo mới thành công!',
			})
		})
	},

	update(req, res) {
		const { notificationId } = req.params
		const data = req.body

		const query = 'UPDATE notification SET ? WHERE id = ?'
		db.query(query, [data, notificationId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật thông báo thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thông báo mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { notificationId } = req.params
		const query = 'DELETE FROM notification WHERE id = ?'

		db.query(query, [notificationId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa thông báo này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa thông báo thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thông báo mà bạn muốn xóa!',
			})
		})
	},
}
