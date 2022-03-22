require('dotenv').config()

const db = require('../db')
const axios = require('axios').default

module.exports = {
	get(req, res) {
		const query = 'SELECT * FROM shop_info'
		db.query(query, async (error, response) => {
			if (error) throw error

			if (response.length === 0) {
				return res.json({
					statusCode: 404,
					message: 'Không tìm thấy dữ liệu!',
				})
			}

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
				{ province_id: response[0].province_id },
				{
					headers: {
						token: process.env.GHN_TOKEN,
					},
				}
			)
			const ward = await axios.post(
				'https://online-gateway.ghn.vn/shiip/public-api/master-data/ward',
				{ district_id: response[0].district_id },
				{
					headers: {
						token: process.env.GHN_TOKEN,
					},
				}
			)

			const provinceName = province.data.data.find(
				item => item.ProvinceID === response[0].province_id
			).ProvinceName

			const districtName = district.data.data.find(
				item => item.DistrictID === response[0].district_id
			).DistrictName

			const wardName = ward.data.data.find(
				item => item.WardCode === response[0].ward_code
			).WardName

			const fullAddress = `${response[0].address}, ${wardName}, ${districtName}, ${provinceName}`

			res.json({
				statusCode: 200,
				message: 'Xử lý thành công!',
				content: {
					...response[0],
					full_address: fullAddress,
				},
			})
		})
	},

	update(req, res) {
		const { shopId } = req.params
		const data = req.body
		const query = 'UPDATE shop_info SET ? WHERE id = ?'
		db.query(query, [data, shopId], (error, response) => {
			if (error) throw error

			if (response.affectedRows > 0) {
				res.json({
					statusCode: 200,
					message: 'Cập nhật thông tin cửa hàng thành công!',
				})
				return
			}

			res.status(404).json({
				statusCode: 404,
				message: 'Không tìm thấy thông tin cửa hàng mà bạn muốn cập nhật!',
			})
		})
	},
}
