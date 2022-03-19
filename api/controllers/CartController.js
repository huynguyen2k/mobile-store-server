const db = require('../db')

module.exports = {
	getAll(req, res) {
		const { user_id } = req.query
		const query = `
      SELECT c.*, o.product_id, o.ram_id, o.rom_id, o.color_id, o.original_price,
      o.sale_price, o.quantity as total_quantity, o.sold_quantity, ram.name as ram_name, 
			rom.name as rom_name, color.name as color_name, p.name as product_name
      FROM cart c, product_option o, ram_option ram, 
      rom_option rom, color_option color, product p
      WHERE c.user_id = ? AND c.product_option_id = o.id AND
      o.ram_id = ram.id AND o.rom_id = rom.id AND o.color_id = color.id AND
      o.product_id = p.id
    `

		db.query(query, [user_id], async (error, response) => {
			if (error) throw error

			const promises = response.map(
				e =>
					new Promise((resolve, reject) => {
						const query = 'SELECT * FROM product_image WHERE product_id = ?'
						db.query(query, [e.product_id], (error, response) => {
							if (error) throw error

							if (response.length > 0) {
								e.product_image = response[0].image
							}
							resolve()
						})
					})
			)

			await Promise.all(promises)

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: response,
			})
		})
	},

	add(req, res) {
		const data = req.body
		const query =
			'SELECT * FROM cart WHERE user_id = ? AND product_option_id = ?'

		db.query(
			query,
			[data.user_id, data.product_option_id],
			(error, response) => {
				if (error) throw error

				if (response.length === 0) {
					const query = 'INSERT INTO cart SET ?'
					db.query(query, [data], (error, response) => {
						if (error) throw error

						res.json({
							statusCode: 200,
							message: 'Thêm sản phẩm vào giỏ hàng thành công!',
						})
					})
				} else {
					const newData = {
						...response[0],
						quantity: response[0].quantity + data.quantity,
					}
					const query = 'UPDATE cart SET ? WHERE id = ?'
					db.query(query, [newData, newData.id], (error, response) => {
						if (error) throw error

						res.json({
							statusCode: 200,
							message: 'Thêm sản phẩm vào giỏ hàng thành công!',
						})
					})
				}
			}
		)
	},

	update(req, res) {
		const { cartId } = req.params
		const data = req.body
		const query = 'UPDATE cart SET ? WHERE id = ?'

		db.query(query, [data, cartId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật giỏ hàng thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy giỏ hàng mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { cartId } = req.params
		const query = 'DELETE FROM cart WHERE id = ?'

		db.query(query, [cartId], (error, response) => {
			if (error) {
				return res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa sản phẩm này!',
				})
			}

			if (response.affectedRows > 0) {
				return res.json({
					statusCode: 200,
					message: 'Xóa sản phẩm thành công!',
				})
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy sản phẩm mà bạn muốn xóa!',
			})
		})
	},
}
