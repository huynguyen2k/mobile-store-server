require('dotenv').config()

const db = require('../db')
const fs = require('fs')

module.exports = {
	getAll(req, res) {
		const { userId, productId } = req.query
		const query = `
			SELECT pr.*, u.full_name, u.avatar
			FROM product_rating pr, user u
			WHERE pr.user_id = u.id
			ORDER BY pr.created_date DESC
		`
		db.query(query, async (error, response) => {
			if (error) throw error

			if (userId) {
				response = response.filter(e => e.user_id == userId)
			}

			if (productId) {
				response = response.filter(e => e.product_id == productId)
			}

			const promiseList = response.map(x => {
				return new Promise((resolve, reject) => {
					const query = 'SELECT * FROM rating_image WHERE rating_id = ?'
					db.query(query, [x.id], (error, response) => {
						if (error) throw error

						x.images = response
						resolve()
					})
				})
			})

			await Promise.all(promiseList)

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	add(req, res) {
		const { images, ...data } = req.body
		const query = 'INSERT INTO product_rating SET ?'

		db.query(query, [data], async (error, response) => {
			if (error) throw error

			const ratingId = response.insertId
			const promiseList = images.map(image => {
				return new Promise((resolve, reject) => {
					const data = {
						image: image,
						rating_id: ratingId,
					}
					const query = 'INSERT INTO rating_image SET ?'
					db.query(query, [data], (error, response) => {
						if (error) throw error

						resolve()
					})
				})
			})
			await Promise.all(promiseList)

			res.json({
				statusCode: 200,
				message: 'Thêm đánh giá thành công!',
			})
		})
	},

	uploadImage(req, res) {
		if (req.file) {
			const imageUrl = `${process.env.BASE_URL}/${req.file.path
				.split('\\')
				.slice(1)
				.join('/')}`
			res.json({
				message: 'Xử lý thành công!',
				statusCode: '200',
				location: imageUrl,
			})
		} else {
			res.status(400).json({
				message: 'Không tìm thấy ảnh mà bạn tải lên!',
				statusCode: 400,
			})
		}
	},

	deleteImage(req, res) {
		const { image } = req.body
		const imageName = image.slice(image.lastIndexOf('/') + 1)
		fs.unlinkSync(`./public/images/ratings/${imageName}`)

		const query = 'DELETE FROM rating_image WHERE image = ?'
		db.query(query, [image], async (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
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
