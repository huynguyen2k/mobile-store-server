const db = require('../db')

module.exports = {
	getAll(req, res) {
		const { customerId } = req.query

		const query = `
			SELECT o.*, os.name as status_name, u.avatar as customer_avatar
			FROM \`order\` o, user u, order_status os
			WHERE o.status_id = os.id AND o.customer_id = u.id
			ORDER BY o.created_date DESC
		`
		db.query(query, async (error, response) => {
			if (error) throw error

			if (customerId) {
				response = response.filter(e => e.customer_id == customerId)
			}

			const promiseList = response.map(order => {
				return new Promise((resolve, reject) => {
					const query = `
						SELECT od.*, ram.name as ram_name, rom.name as rom_name, color.name as color_name,
						p.id as product_id, p.name as product_name
						FROM order_detail od, product_option po, ram_option ram, rom_option rom,
						color_option color, product p
						WHERE od.order_id = ? AND od.product_option_id = po.id AND
						po.ram_id = ram.id AND po.rom_id = rom.id AND 
						po.color_id = color.id AND po.product_id = p.id
					`

					db.query(query, [order.id], async (error, response) => {
						if (error) throw error

						const promiseList = response.map(orderItem => {
							return new Promise((resolve, reject) => {
								const query = 'SELECT * FROM product_image WHERE product_id = ?'

								db.query(query, [orderItem.product_id], (error, response) => {
									if (error) throw error
									orderItem.product_image = response[0].image
									resolve()
								})
							})
						})

						await Promise.all(promiseList)
						order.orderDetail = response
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

	getAllOrderStatus(req, res) {
		const query = 'SELECT * FROM order_status'

		db.query(query, (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	get(req, res) {
		const { orderId } = req.params

		const query = `
			SELECT o.*, os.name as status_name, u.avatar as customer_avatar
			FROM \`order\` o, user u, order_status os
			WHERE o.id = ? AND o.status_id = os.id AND o.customer_id = u.id
		`
		db.query(query, [orderId], async (error, response) => {
			if (error) throw error

			if (response.length === 0) {
				return res.status(404).json({
					statusCode: 404,
					message: 'Không tìm thấy dữ liệu!',
				})
			}

			const promiseList = response.map(order => {
				return new Promise((resolve, reject) => {
					const query = `
						SELECT od.*, ram.name as ram_name, rom.name as rom_name, color.name as color_name,
						p.id as product_id, p.name as product_name
						FROM order_detail od, product_option po, ram_option ram, rom_option rom,
						color_option color, product p
						WHERE od.order_id = ? AND od.product_option_id = po.id AND
						po.ram_id = ram.id AND po.rom_id = rom.id AND 
						po.color_id = color.id AND po.product_id = p.id
					`

					db.query(query, [order.id], async (error, response) => {
						if (error) throw error

						const promiseList = response.map(orderItem => {
							return new Promise((resolve, reject) => {
								const query = 'SELECT * FROM product_image WHERE product_id = ?'

								db.query(query, [orderItem.product_id], (error, response) => {
									if (error) throw error
									orderItem.product_image = response[0].image
									resolve()
								})
							})
						})

						await Promise.all(promiseList)
						order.orderDetail = response
						resolve()
					})
				})
			})

			await Promise.all(promiseList)

			const order = response[0]
			const query = `
				SELECT ot.*, os.name as status_name
				FROM order_tracking ot, order_status os
				WHERE ot.order_id = ? AND ot.status_id = os.id
				ORDER BY ot.created_date ASC
			`

			db.query(query, [order.id], (error, response) => {
				if (error) throw error

				order.orderStatus = response
				res.json({
					statusCode: 200,
					message: 'Xử lý thành công!',
					content: order,
				})
			})
		})
	},

	add(req, res) {
		const { order, orderDetail } = req.body
		const query = 'INSERT INTO `order` SET ?'

		db.query(query, [order], async (error, response) => {
			if (error) throw error

			const orderId = response.insertId

			const promiseList = orderDetail.map(e => {
				return new Promise((resolve, reject) => {
					const query = 'INSERT INTO order_detail SET ?'
					db.query(query, [{ ...e, order_id: orderId }], (error, response) => {
						if (error) throw error

						const query = 'SELECT * FROM product_option WHERE id = ?'
						db.query(query, [e.product_option_id], (error, response) => {
							if (error) throw error

							const data = {
								sold_quantity: response[0].sold_quantity + e.quantity,
							}
							const query = 'UPDATE product_option SET ? WHERE id = ?'
							db.query(
								query,
								[data, e.product_option_id],
								(error, response) => {
									if (error) throw error

									resolve()
								}
							)
						})
					})
				})
			})
			await Promise.all(promiseList)

			const query = 'INSERT INTO order_tracking SET ?'
			const data = {
				status_id: 1,
				order_id: orderId,
				user_id: order.customer_id,
				created_date: order.created_date,
			}
			db.query(query, [data], (error, response) => {
				if (error) throw error

				if (order.coupons_id === null) {
					return res.json({
						statusCode: 200,
						message: 'Bạn đã đặt hàng thành công!',
						orderId,
					})
				}

				const query = 'SELECT * FROM coupons WHERE id = ?'
				db.query(query, [order.coupons_id], (error, response) => {
					if (error) throw error

					const data = {
						used_quantity: response[0].used_quantity + 1,
					}
					const query = 'UPDATE coupons SET ? WHERE id = ?'
					db.query(query, [data, order.coupons_id], (error, response) => {
						if (error) throw error

						return res.json({
							statusCode: 200,
							message: 'Bạn đã đặt hàng thành công!',
							orderId,
						})
					})
				})
			})
		})
	},

	update(req, res) {
		const orderId = Number(req.params.orderId)
		const { current_status_id, status_id, user_id, created_date } = req.body
		const query = 'UPDATE `order` SET ? WHERE id = ?'

		db.query(query, [{ status_id }, orderId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				const data = {
					created_date,
					status_id: current_status_id,
					order_id: orderId,
					user_id,
				}

				const query = 'INSERT INTO order_tracking SET ?'
				db.query(query, [data], (error, response) => {
					if (error) throw error

					if (status_id !== 7) {
						return res.json({
							statusCode: 200,
							message: 'Cập nhật đơn hàng thành công!',
						})
					}

					const query = 'SELECT * FROM `order_detail` WHERE order_id = ?'
					db.query(query, [orderId], async (error, orderDetail) => {
						if (error) return error

						const promiseList = orderDetail.map(e => {
							return new Promise((resolve, reject) => {
								const query = 'SELECT * FROM product_option WHERE id = ?'
								db.query(query, [e.product_option_id], (error, response) => {
									if (error) throw error

									const data = {
										sold_quantity: response[0].sold_quantity - e.quantity,
									}
									const query = 'UPDATE product_option SET ? WHERE id = ?'
									db.query(
										query,
										[data, e.product_option_id],
										(error, response) => {
											if (error) throw error

											resolve()
										}
									)
								})
							})
						})
						await Promise.all(promiseList)

						return res.json({
							statusCode: 200,
							message: 'Cập nhật đơn hàng thành công!',
						})
					})
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy đơn hàng mà bạn muốn cập nhật!',
			})
		})
	},
}
