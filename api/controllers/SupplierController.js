require('dotenv').config()

const db = require('../db')
const axios = require('axios').default

module.exports = {
	getAll(req, res) {
		const query = 'SELECT * FROM supplier'

		db.query(query, async (error, response) => {
			if (error) throw error

			const content = await Promise.all(
				response.map(async record => {
					const province = await axios.get(
						'https://online-gateway.ghn.vn/shiip/public-api/master-data/province',
						{
							headers: {
								token: process.env.GHN_TOKEN,
							},
						}
					)
					const district = await axios.post(
						'https://online-gateway.ghn.vn/shiip/public-api/master-data/district',
						{ province_id: record.province_id },
						{
							headers: {
								token: process.env.GHN_TOKEN,
							},
						}
					)
					const ward = await axios.post(
						'https://online-gateway.ghn.vn/shiip/public-api/master-data/ward',
						{ district_id: record.district_id },
						{
							headers: {
								token: process.env.GHN_TOKEN,
							},
						}
					)

					return {
						...record,
						province_name: province.data.data.find(
							item => item.ProvinceID === record.province_id
						).ProvinceName,
						district_name: district.data.data.find(
							item => item.DistrictID === record.district_id
						).DistrictName,
						ward_name: ward.data.data.find(
							item => item.WardCode === record.ward_code
						).WardName,
					}
				})
			)

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: content,
			})
		})
	},

	add(req, res) {
		const data = req.body
		const query = 'INSERT INTO supplier SET ?'

		db.query(query, [data], (error, response) => {
			if (error) throw error

			res.json({
				statusCode: 200,
				message: 'Thêm nhà cung cấp thành công!',
			})
		})
	},

	update(req, res) {
		const { supplierId } = req.params
		const data = req.body
		const query = 'UPDATE supplier SET ? WHERE id = ?'

		db.query(query, [data, supplierId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật nhà cung cấp thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy nhà cung cấp mà bạn muốn cập nhật!',
			})
		})
	},

	delete(req, res) {
		const { supplierId } = req.params
		const query = 'DELETE FROM supplier WHERE id = ?'

		db.query(query, [supplierId], (error, response) => {
			if (error) {
				res.status(400).json({
					statusCode: 400,
					message: 'Không thể xóa nhà cung cấp này!',
				})
				return
			}

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Xóa nhà cung cấp thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy nhà cung cấp mà bạn muốn xóa!',
			})
		})
	},
}
