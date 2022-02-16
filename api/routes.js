require('dotenv').config()

const jwt = require('jsonwebtoken')
const multer = require('multer')

const avatarStorage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, './public/images/avatars')
	},
	filename: (req, file, cb) => {
		cb(null, Date.now() + file.originalname)
	},
})

const bannerStorage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, './public/images/banners')
	},
	filename: (req, file, cb) => {
		cb(null, Date.now() + file.originalname)
	},
})

const uploadAvatar = multer({ storage: avatarStorage })
const uploadBanner = multer({ storage: bannerStorage })

const authToken = (req, res, next) => {
	const authHeader = req.headers['authorization']
	const token = authHeader && authHeader.split(' ')[1]

	if (!token) return res.sendStatus(401)

	jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (error, user) => {
		if (error) return res.sendStatus(403)

		req.user = user
		next()
	})
}

module.exports = function (app) {
	// User API
	const userCtrl = require('./controllers/UserController')
	app.post('/api/users/login', userCtrl.login)
	app.post('/api/users/register', userCtrl.register)
	app.get('/api/users/get-all-role', userCtrl.getAllRole)
	app.get('/api/users/get-all-customer', authToken, userCtrl.getAllCustomer)
	app.get('/api/users/get-all-staff', authToken, userCtrl.getAllStaff)
	app.post('/api/users', uploadAvatar.single('avatar'), userCtrl.add)
	app.put('/api/users/update', uploadAvatar.single('avatar'), userCtrl.update)
	app.put('/api/users/update-password', authToken, userCtrl.updatePassword)
	app.delete('/api/users/:userId', userCtrl.delete)

	// Brand API
	const brandCtrl = require('./controllers/BrandController')
	app.get('/api/brands', brandCtrl.getAll)
	app.get('/api/brands/:brandId', brandCtrl.get)
	app.post('/api/brands', brandCtrl.add)
	app.put('/api/brands/:brandId', brandCtrl.update)
	app.delete('/api/brands/:brandId', brandCtrl.delete)

	// Ram Option API
	const ramOptionCtrl = require('./controllers/RamOptionController')
	app.get('/api/product-option/ram', ramOptionCtrl.getAll)
	app.get('/api/product-option/ram/:ramId', ramOptionCtrl.get)
	app.post('/api/product-option/ram', ramOptionCtrl.add)
	app.put('/api/product-option/ram/:ramId', ramOptionCtrl.update)
	app.delete('/api/product-option/ram/:ramId', ramOptionCtrl.delete)

	// Rom Option API
	const romOptionCtrl = require('./controllers/RomOptionController')
	app.get('/api/product-option/rom', romOptionCtrl.getAll)
	app.get('/api/product-option/rom/:romId', romOptionCtrl.get)
	app.post('/api/product-option/rom', romOptionCtrl.add)
	app.put('/api/product-option/rom/:romId', romOptionCtrl.update)
	app.delete('/api/product-option/rom/:romId', romOptionCtrl.delete)

	// Color Option API
	const colorOptionCtrl = require('./controllers/ColorOptionController')
	app.get('/api/product-option/color', colorOptionCtrl.getAll)
	app.get('/api/product-option/color/:colorId', colorOptionCtrl.get)
	app.post('/api/product-option/color', colorOptionCtrl.add)
	app.put('/api/product-option/color/:colorId', colorOptionCtrl.update)
	app.delete('/api/product-option/color/:colorId', colorOptionCtrl.delete)

	// Banner API
	const bannerCtrl = require('./controllers/BannerController')
	app.get('/api/banners', bannerCtrl.getAll)
	app.post('/api/banners', uploadBanner.single('image'), bannerCtrl.add)
	app.put(
		'/api/banners/:bannerId',
		uploadBanner.single('image'),
		bannerCtrl.update
	)
	app.delete('/api/banners/:bannerId', bannerCtrl.delete)
}
