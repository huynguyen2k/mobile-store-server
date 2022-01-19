const multer = require('multer')
const storage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, './public/images')
	},
	filename: (req, file, cb) => {
		cb(null, Date.now() + file.originalname)
	},
})

const upload = multer({ storage: storage })

module.exports = function (app) {
	// User API
	const userCtrl = require('./controllers/UserController')
	app.post('/api/users/signUp', upload.single('avatar'), userCtrl.signUp)
	app.post('/api/users/signIn', userCtrl.signIn)

	// Brand API
	const brandCtrl = require('./controllers/BrandController')
	app.get('/api/brands', brandCtrl.getAll)
	app.get('/api/brands/:brandId', brandCtrl.get)
	app.post('/api/brands', brandCtrl.add)
	app.put('/api/brands/:brandId', brandCtrl.update)
	app.delete('/api/brands/:brandId', brandCtrl.delete)
}
