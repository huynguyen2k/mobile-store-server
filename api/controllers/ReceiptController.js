const db = require('../db')

module.exports = {
	getAll(req, res) {
		const query = `
      SELECT r.*, s.name as supplier_name, u.full_name, u.avatar
      FROM receipt r, supplier s, user u
      WHERE r.supplier_id = s.id AND r.user_id = u.id
    `

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
		const { receiptId } = req.params
		const query = `
      SELECT r.*, s.name as supplier_name
      FROM receipt r, supplier s
      WHERE r.id = ? AND r.supplier_id = s.id
    `

		db.query(query, [receiptId], async (error, response) => {
			if (error) throw error

			if (response.length === 0) {
				return res.status(404).json({
					statusCode: 404,
					message: 'Không tìm thấy tài nguyên!',
				})
			}

			const query = `
        SELECT r.*, p.product_id, pd.name as product_name, p.ram_id, ram.name as ram_name,
				p.rom_id, rom.name as rom_name, p.color_id, color.name as color_name
        FROM receipt_detail r, product_option p, product pd,
				ram_option ram, rom_option rom, color_option color
        WHERE r.receipt_id = ? AND r.product_option_id = p.id
				AND p.ram_id = ram.id AND p.rom_id = rom.id 
				AND p.color_id = color.id AND pd.id = p.product_id
      `
			db.query(query, [receiptId], (error, receiptDetail) => {
				if (error) throw error

				response[0].receipt_detail = receiptDetail
				res.json({
					statusCode: 200,
					message: 'Xử lý thành công!',
					content: response[0],
				})
			})
		})
	},

	add(req, res) {
		const { receipt_detail, ...data } = req.body
		const query = 'INSERT INTO receipt SET ?'

		db.query(query, [data], async (error, response) => {
			if (error) throw error

			const receiptId = response.insertId
			const promises = receipt_detail.map(item => {
				return new Promise((resolve, reject) => {
					const data = { ...item, receipt_id: receiptId }
					const query = 'INSERT INTO receipt_detail SET ?'

					db.query(query, [data], (error, result) => {
						if (error) throw error

						const query =
							'SELECT SUM(quantity) AS quantity FROM receipt_detail WHERE product_option_id = ?'
						db.query(query, [data.product_option_id], (error, response) => {
							if (error) throw error

							const newQuantity = {
								quantity: response[0].quantity,
							}
							const query = 'UPDATE product_option SET ? WHERE id = ?'
							db.query(
								query,
								[newQuantity, data.product_option_id],
								(error, response) => {
									if (error) throw error
									resolve()
								}
							)
						})
					})
				})
			})
			await Promise.all(promises)

			res.json({
				statusCode: 200,
				message: 'Thêm phiếu nhập hàng thành công!',
			})
		})
	},
}
