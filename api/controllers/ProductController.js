require('dotenv').config()

const db = require('../db')
const fs = require('fs')

module.exports = {
	async add(req, res) {
		const { product_options, images, ...data } = req.body

		const query = 'INSERT INTO product SET ?'
		db.query(query, [data], async (error, response) => {
			if (error) throw error

			const productId = response.insertId
			const imageQueries = images.map(image => {
				return new Promise((resolve, reject) => {
					const data = {
						image: image,
						product_id: productId,
					}
					const query = 'INSERT INTO product_image SET ?'
					db.query(query, [data], (error, result) => {
						if (error) throw error
						resolve()
					})
				})
			})
			await Promise.all(imageQueries)

			const optionQueries = product_options.map(option => {
				return new Promise((resolve, reject) => {
					const data = {
						...option,
						product_id: productId,
						quantity: 0,
						sold_quantity: 0,
					}

					const query = 'INSERT INTO product_option SET ?'
					db.query(query, [data], (error, result) => {
						if (error) throw error
						resolve()
					})
				})
			})
			await Promise.all(optionQueries)

			res.json({
				message: 'Thêm sản phẩm mới thành công!',
				statusCode: '200',
			})
		})
	},

	async update(req, res) {
		const { productId } = req.params
		const { images, ...data } = req.body

		const query = 'UPDATE product SET ? WHERE id = ?'
		db.query(query, [data, productId], async (error, response) => {
			if (error) throw error

			const query = 'DELETE FROM product_image WHERE product_id = ?'
			db.query(query, [productId], async (error, response) => {
				if (error) throw error

				const imageQueries = images.map(image => {
					return new Promise((resolve, reject) => {
						const data = {
							image: image,
							product_id: productId,
						}
						const query = 'INSERT INTO product_image SET ?'
						db.query(query, [data], (error, result) => {
							if (error) throw error
							resolve()
						})
					})
				})
				await Promise.all(imageQueries)

				res.json({
					message: 'Cập nhật thông tin sản phẩm thành công!',
					statusCode: '200',
				})
			})
		})
	},

	updateProductStatus(req, res) {
		const { productId } = req.params
		const data = req.body
		const query = 'UPDATE product SET ? WHERE id = ?'

		db.query(query, [data, productId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật trạng thái sản phẩm thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy sản phẩm mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { productId } = req.params
		const query = 'SELECT * FROM product_option WHERE product_id = ?'

		db.query(query, [productId], (error, response) => {
			if (error) throw error

			if (response.length > 0) {
				return res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa sản phẩm này!',
				})
			}

			const query = 'SELECT * FROM product_rating WHERE product_id = ?'
			db.query(query, [productId], (error, response) => {
				if (error) throw error

				if (response.length > 0) {
					return res.status(400).json({
						statusCode: 400,
						message: 'Không thể xóa sản phẩm này!',
					})
				}

				const query = 'DELETE FROM product_image WHERE product_id = ?'
				db.query(query, [productId], (error, response) => {
					if (error) throw error

					const query = 'DELETE FROM product WHERE id = ?'
					db.query(query, [productId], (error, response) => {
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
				})
			})
		})
	},

	addProductOption(req, res) {
		const data = {
			...req.body,
			quantity: 0,
			sold_quantity: 0,
		}
		const query = `
			SELECT * FROM product_option
			WHERE product_id = ? AND ram_id = ? AND rom_id = ? AND color_id = ?
		`
		db.query(
			query,
			[data.product_id, data.ram_id, data.rom_id, data.color_id],
			(error, response) => {
				if (error) throw error

				if (response.length > 0) {
					return res.status(400).json({
						message: 'Cấu hình này đã tồn tại!',
						statusCode: 400,
					})
				}

				const query = 'INSERT INTO product_option SET ?'
				db.query(query, [data], (error, response) => {
					if (error) throw error

					return res.json({
						message: 'Thêm cấu hình mới thành công!',
						statusCode: 200,
					})
				})
			}
		)
	},

	updateProductOption(req, res) {
		const { optionId } = req.params
		const data = req.body

		const query = `
			SELECT * FROM product_option
			WHERE product_id = ? AND ram_id = ? AND rom_id = ? AND color_id = ? AND id != ?
		`
		db.query(
			query,
			[data.product_id, data.ram_id, data.rom_id, data.color_id, optionId],
			(error, response) => {
				if (error) throw error

				if (response.length > 0) {
					return res.status(400).json({
						message: 'Cấu hình mà bạn muốn cập nhật đã tồn tại!',
						statusCode: 400,
					})
				}

				const query = 'UPDATE product_option SET ? WHERE id = ?'
				db.query(query, [data, optionId], (error, response) => {
					if (error) throw error

					return res.json({
						message: 'Cập nhật cấu hình thành công!',
						statusCode: 200,
					})
				})
			}
		)
	},

	deleteProductOption(req, res) {
		const { optionId } = req.params
		const query = 'DELETE FROM product_option WHERE id = ?'

		db.query(query, [optionId], (error, response) => {
			if (error) {
				return res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa cấu hình này!',
				})
			}

			if (response.affectedRows > 0) {
				return res.json({
					statusCode: 200,
					message: 'Xóa cấu hình thành công!',
				})
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy cấu hình mà bạn muốn xóa!',
			})
		})
	},

	upload(req, res) {
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

	deleteUploadFile(req, res) {
		const { image } = req.body
		const imageName = image.slice(image.lastIndexOf('/') + 1)
		fs.unlinkSync(`./public/images/products/${imageName}`)

		const query = 'DELETE FROM product_image WHERE image = ?'
		db.query(query, [image], async (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
			})
		})
	},

	get(req, res) {
		const { productId } = req.params
		const query = `
			SELECT p.*, b.name as brand_name
			FROM product p, brand b
			WHERE p.id = ? AND p.brand_id = b.id 
		`

		db.query(query, [productId], async (error, productList) => {
			if (error) throw error

			if (productList.length === 0) {
				return res.status(404).json({
					statusCode: 404,
					message: 'Không tìm thấy tài nguyên!',
				})
			}

			const product = productList[0]
			const query = 'SELECT * FROM product_image WHERE product_id = ?'
			db.query(query, [product.id], (error, response) => {
				if (error) throw error
				product.images = response

				const query = `
					SELECT p.*, ram.name as ram_name, rom.name as rom_name, color.name as color_name
					FROM product_option p, ram_option ram, rom_option rom, color_option color 
					WHERE p.product_id = ?
					AND p.ram_id = ram.id
					AND p.rom_id = rom.id 
					AND p.color_id = color.id
				`

				db.query(query, [product.id], (error, response) => {
					if (error) throw error
					product.product_options = response

					const query = 'SELECT * FROM product_rating WHERE product_id = ?'
					db.query(query, [product.id], (error, response) => {
						if (error) throw error

						let rating = 0
						if (response.length > 0) {
							rating =
								response.reduce((result, x) => result + x.rating, 0) /
								response.length
						}

						res.json({
							statusCode: 200,
							message: 'Xử lý thành công!',
							content: {
								...product,
								rating: rating,
								rating_quantity: response.length,
							},
						})
					})
				})
			})
		})
	},

	getAll(req, res) {
		const params = req.query
		let hasPublished = false

		if (params.hasOwnProperty('published')) {
			hasPublished = true
		}

		if (params.hasOwnProperty('brand')) {
			params.brand = params.brand.split('-').map(x => parseInt(x))
		}
		if (params.hasOwnProperty('rating')) {
			params.rating = parseInt(params.rating)
		}
		if (params.hasOwnProperty('min_price')) {
			params.min_price = parseInt(params.min_price)
		}
		if (params.hasOwnProperty('max_price')) {
			params.max_price = parseInt(params.max_price)
		}

		let query = `
			SELECT p.*, b.name as brand_name
			FROM product p, brand b
			WHERE p.brand_id = b.id
			${hasPublished ? ` AND p.published = ${params.published}` : ''}
		`
		if (params.sort === 'newest') {
			query = `
				SELECT p.*, b.name as brand_name
				FROM product p, brand b
				WHERE p.brand_id = b.id
				${hasPublished ? ` AND p.published = ${params.published}` : ''}
				ORDER BY p.created_date DESC
			`
		}

		db.query(query, async (error, productList) => {
			if (error) throw error

			const promiseList = productList.map(product => {
				return new Promise((resolve, reject) => {
					const query = 'SELECT * FROM product_image WHERE product_id = ?'
					db.query(query, [product.id], (error, response) => {
						if (error) throw error
						product.images = response

						const query = `
							SELECT p.*, ram.name as ram_name, rom.name as rom_name, color.name as color_name
							FROM product_option p, ram_option ram, rom_option rom, color_option color 
							WHERE p.product_id = ?
							AND p.ram_id = ram.id
							AND p.rom_id = rom.id 
							AND p.color_id = color.id
						`
						db.query(query, [product.id], (error, response) => {
							if (error) throw error

							product.product_options = response
							product.sold_quantity = response.reduce(
								(result, x) => result + x.sold_quantity,
								0
							)
							product.sale_price = response[0].sale_price
							product.original_price = response[0].original_price

							const query = 'SELECT * FROM product_rating WHERE product_id = ?'
							db.query(query, [product.id], (error, response) => {
								if (error) throw error

								let rating = 0
								if (response.length > 0) {
									rating =
										response.reduce((result, x) => result + x.rating, 0) /
										response.length
								}

								product.rating = rating
								product.rating_quantity = response.length
								resolve()
							})
						})
					})
				})
			})

			await Promise.all(promiseList)

			if (params.sort === 'default') {
				productList.sort((a, b) => {
					if (a.rating > b.rating) return -1
					if (a.rating < b.rating) return 1

					if (a.sold_quantity > b.sold_quantity) return -1
					if (a.sold_quantity === b.sold_quantity) return 0
					return 1
				})
			}

			if (params.sort === 'top-seller') {
				productList.sort((a, b) => {
					if (a.sold_quantity > b.sold_quantity) return -1
					if (a.sold_quantity === b.sold_quantity) return 0
					return 1
				})
			}

			if (params.sort === 'price-asc') {
				productList.sort((a, b) => {
					if (a.sale_price < b.sale_price) return -1
					if (a.sale_price === b.sale_price) return 0
					return 1
				})
			}

			if (params.sort === 'price-desc') {
				productList.sort((a, b) => {
					if (a.sale_price > b.sale_price) return -1
					if (a.sale_price === b.sale_price) return 0
					return 1
				})
			}

			if (params.hasOwnProperty('brand')) {
				productList = productList.filter(x => params.brand.includes(x.brand_id))
			}
			if (params.hasOwnProperty('rating')) {
				productList = productList.filter(x => x.rating >= params.rating)
			}
			if (params.hasOwnProperty('min_price')) {
				productList = productList.filter(x => x.sale_price >= params.min_price)
			}
			if (params.hasOwnProperty('max_price')) {
				productList = productList.filter(x => x.sale_price <= params.max_price)
			}
			if (params.hasOwnProperty('product_name')) {
				productList = productList.filter(x =>
					x.name.toLowerCase().includes(params.product_name.toLowerCase())
				)
			}

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: productList,
			})
		})
	},
}
