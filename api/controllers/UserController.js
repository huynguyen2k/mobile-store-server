require('dotenv').config()

const jwt = require('jsonwebtoken')
const db = require('../db')
const fs = require('fs')
const bscript = require('bcrypt')

module.exports = {
	async add(req, res) {
		const data = req.body
		if (req.file) {
			data.avatar =
				process.env.BASE_URL +
				'/' +
				req.file.path.split('\\').slice(1).join('/')
		} else {
			data.avatar = process.env.BASE_URL + '/images/avatars/default_avatar.png'
		}
		data.password = await bscript.hash(data.password, 10)
		if (data.gender) {
			data.gender = parseInt(data.gender)
		}
		data.role_id = parseInt(data.role_id)

		const query = 'SELECT * FROM user WHERE email = ?'
		db.query(query, [data.email], (error, response) => {
			if (error) throw error

			if (response.length >= 1) {
				if (req.file) {
					fs.unlinkSync(req.file.destination + '/' + req.file.filename)
				}
				return res.status(400).json({
					message: 'Email bạn nhập đã tồn tại!',
					statusCode: '400',
				})
			}

			const query = 'SELECT * FROM user WHERE phone_number = ?'
			db.query(query, [data.phone_number], (error, response) => {
				if (error) throw error

				if (response.length >= 1) {
					if (req.file) {
						fs.unlinkSync(req.file.destination + '/' + req.file.filename)
					}
					return res.status(400).json({
						message: 'Số điện thoại bạn nhập đã tồn tại!',
						statusCode: '400',
					})
				}

				const query = 'INSERT INTO user SET ?'
				db.query(query, [data], (error, response) => {
					if (error) throw error

					res.json({
						message: 'Thêm người dùng thành công!',
						statusCode: 200,
					})
				})
			})
		})
	},

	async register(req, res) {
		const data = req.body
		data.avatar = process.env.BASE_URL + '/images/avatars/default_avatar.png'
		data.password = await bscript.hash(data.password, 10)
		data.role_id = parseInt(data.role_id)

		const query = 'SELECT * FROM user WHERE email = ?'
		db.query(query, [data.email], (error, response) => {
			if (error) throw error

			if (response.length >= 1) {
				return res.status(400).json({
					message: 'Email bạn nhập đã tồn tại!',
					statusCode: '400',
				})
			}

			const query = 'SELECT * FROM user WHERE phone_number = ?'
			db.query(query, [data.phone_number], (error, response) => {
				if (error) throw error

				if (response.length >= 1) {
					return res.status(400).json({
						message: 'Số điện thoại bạn nhập đã tồn tại!',
						statusCode: '400',
					})
				}

				const query = 'INSERT INTO user SET ?'
				db.query(query, [data], (error, response) => {
					if (error) throw error

					res.json({
						message: 'Đăng ký tài khoản thành công!',
						statusCode: 200,
					})
				})
			})
		})
	},

	login(req, res) {
		const { email, password } = req.body
		const query = `
			SELECT u.*, ur.name as role_name
			FROM user u, user_role ur
			WHERE u.email = ? AND u.role_id = ur.id
		`

		db.query(query, [email], async (error, response) => {
			if (error) throw error
			let isValid = false
			let user = null

			if (response.length === 1) {
				user = { ...response[0] }
				isValid = await bscript.compare(password, user.password)
				delete user.password
			}

			if (isValid) {
				const accessToken = jwt.sign(
					JSON.stringify(user),
					process.env.ACCESS_TOKEN_SECRET
				)

				return res.json({
					statusCode: 200,
					message: 'Đăng nhập thành công!',
					content: {
						user,
						accessToken,
					},
				})
			}

			res.status(400).json({
				statusCode: 400,
				message: 'Email hoặc mật khẩu không hợp lệ!',
			})
		})
	},

	getAllRole(req, res) {
		const query = 'SELECT * FROM user_role'
		db.query(query, (error, response) => {
			if (error) throw error

			return res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	getAllCustomer(req, res) {
		const user = req.user
		if (user.role_name === 'Khách hàng') return res.sendStatus(403)

		const query = `
			SELECT u.*, ur.name as role_name
			FROM user u, user_role ur
			WHERE u.role_id = ur.id AND ur.name = ?
		`
		db.query(query, ['Khách hàng'], (error, response) => {
			if (error) throw error

			return res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	getAllStaff(req, res) {
		const user = req.user
		if (user.role_name !== 'Quản trị') return res.sendStatus(403)

		const query = `
			SELECT u.*, ur.name as role_name
			FROM user u, user_role ur
			WHERE u.role_id = ur.id AND ur.name != ?
		`
		db.query(query, ['Khách hàng'], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	update(req, res) {
		const data = req.body
		data.id = parseInt(data.id)
		if (data.gender) {
			data.gender = parseInt(data.gender)
		}
		data.role_id = parseInt(data.role_id)

		const query = 'SELECT * FROM user WHERE phone_number = ? AND id != ?'
		db.query(query, [data.phone_number, data.id], (error, response) => {
			if (error) throw error

			if (response.length >= 1) {
				if (req.file) {
					fs.unlinkSync(req.file.destination + '/' + req.file.filename)
				}
				return res.status(400).json({
					message: 'Số điện thoại bạn nhập đã tồn tại!',
					statusCode: '400',
				})
			}

			const query = 'SELECT * FROM user WHERE id = ?'
			db.query(query, [data.id], (error, response) => {
				if (error) throw error

				if (response.length === 1) {
					if (req.file) {
						let avatarUrl = response[0].avatar
						avatarUrl = avatarUrl.slice(avatarUrl.lastIndexOf('/') + 1)

						if (avatarUrl !== 'default_avatar.png') {
							fs.unlinkSync(`./public/images/avatars/${avatarUrl}`)
						}

						data.avatar =
							process.env.BASE_URL +
							'/' +
							req.file.path.split('\\').slice(1).join('/')
					}

					const query = 'UPDATE user SET ? WHERE id = ?'
					db.query(query, [data, data.id], (error, response) => {
						if (error) throw error

						const query = `
							SELECT u.*, ur.name as role_name
							FROM user u, user_role ur
							WHERE u.id = ? AND u.role_id = ur.id
						`
						db.query(query, [data.id], (error, response) => {
							if (error) throw error

							res.json({
								statusCode: 200,
								message: 'Cập nhật thông tin người dùng thành công!',
								content: response[0],
							})
						})
					})
				} else {
					if (req.file) {
						fs.unlinkSync(req.file.destination + '/' + req.file.filename)
					}

					res.status(400).json({
						statusCode: 400,
						message: 'Không tìm thầy tài khoản mà bạn muốn cập nhật!',
					})
				}
			})
		})
	},

	updatePassword(req, res) {
		const { email } = req.user
		const { password, new_password } = req.body
		const query = 'SELECT * FROM user WHERE email = ?'

		db.query(query, [email], async (error, response) => {
			if (error) throw error
			let isValid = false

			if (response.length === 1) {
				isValid = await bscript.compare(password, response[0].password)
			}

			if (isValid) {
				const hashedNewPassword = await bscript.hash(new_password, 10)
				const data = { password: hashedNewPassword }
				const query = 'UPDATE user SET ? WHERE email = ?'

				db.query(query, [data, email], (error, response) => {
					if (error) throw error

					res.json({
						statusCode: 200,
						message: 'Thay đổi mật khẩu thành công!',
					})
				})
			} else {
				res.status(400).json({
					statusCode: 400,
					message: 'Mật khẩu bạn nhập không đúng!',
				})
			}
		})
	},

	delete(req, res) {
		const { userId } = req.params
		const query = 'SELECT * FROM user WHERE id = ?'

		db.query(query, [userId], (error, response) => {
			if (error) throw error

			if (response.length === 1) {
				let avatarUrl = response[0].avatar
				avatarUrl = avatarUrl.slice(avatarUrl.lastIndexOf('/') + 1)

				const query = 'DELETE FROM user WHERE id = ?'
				db.query(query, [userId], (error, response) => {
					if (error) {
						return res.status(400).json({
							statusCode: 400,
							message: 'Không thể xóa người dùng này!',
						})
					}

					if (avatarUrl !== 'default_avatar.png') {
						fs.unlinkSync(`./public/images/avatars/${avatarUrl}`)
					}

					res.json({
						statusCode: 200,
						message: 'Xóa người dùng thành công!',
					})
				})
			} else {
				res.status(400).json({
					statusCode: 400,
					message: 'Không tìm thầy người dùng mà bạn muốn xóa!',
				})
			}
		})
	},
}
