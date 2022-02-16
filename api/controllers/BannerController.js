require('dotenv').config()

const db = require('../db')
const fs = require('fs')

module.exports = {
	getAll(req, res) {
		let { published } = req.query
		if (published !== undefined) {
			published = Number(published)
		}

		const query = `
    SELECT b.*, u.avatar, u.full_name
    FROM banner b, user u
    WHERE b.user_id = u.id
    `

		db.query(query, async (error, response) => {
			if (error) throw error

			if (published === undefined) {
				return res.json({
					statusCode: 200,
					message: 'Xử lý thành công!',
					content: response,
				})
			}

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response.filter(item => item.published === published),
			})
		})
	},

	async add(req, res) {
		const data = req.body
		data.image =
			process.env.BASE_URL + '/' + req.file.path.split('\\').slice(1).join('/')
		data.published = Number(data.published)
		data.user_id = Number(data.user_id)

		const query = 'INSERT INTO banner SET ?'
		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				message: 'Thêm banner thành công!',
				statusCode: 200,
			})
		})
	},

	update(req, res) {
		const { bannerId } = req.params
		const data = req.body
		data.published = Number(data.published)

		const query = 'SELECT * FROM banner WHERE id = ?'
		db.query(query, [bannerId], (error, response) => {
			if (error) throw error

			if (response.length === 1) {
				if (req.file) {
					let bannerUrl = response[0].image
					bannerUrl = bannerUrl.slice(bannerUrl.lastIndexOf('/') + 1)
					fs.unlinkSync(`./public/images/banners/${bannerUrl}`)
					data.image =
						process.env.BASE_URL +
						'/' +
						req.file.path.split('\\').slice(1).join('/')
				}

				const query = 'UPDATE banner SET ? WHERE id = ?'
				db.query(query, [data, bannerId], (error, response) => {
					if (error) throw error

					res.json({
						statusCode: 200,
						message: 'Cập nhật banner thành công!',
					})
				})
			} else {
				if (req.file) {
					fs.unlinkSync(req.file.destination + '/' + req.file.filename)
				}

				res.status(400).json({
					statusCode: 400,
					message: 'Không tìm thầy banner mà bạn muốn cập nhật!',
				})
			}
		})
	},

	delete(req, res) {
		const { bannerId } = req.params
		const query = 'SELECT * FROM banner WHERE id = ?'

		db.query(query, [bannerId], (error, response) => {
			if (error) throw error

			if (response.length === 1) {
				let bannerUrl = response[0].image
				bannerUrl = bannerUrl.slice(bannerUrl.lastIndexOf('/') + 1)
				fs.unlinkSync(`./public/images/banners/${bannerUrl}`)

				const query = 'DELETE FROM banner WHERE id = ?'
				db.query(query, [bannerId], (error, response) => {
					if (error) throw error

					res.json({
						statusCode: 200,
						message: 'Xóa banner thành công!',
					})
				})
			} else {
				res.status(400).json({
					statusCode: 400,
					message: 'Không tìm thầy banner mà bạn muốn xóa!',
				})
			}
		})
	},
}
