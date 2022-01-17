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
	// Users API
	const userCtrl = require('./controllers/UserController')
	app.post('/api/users/signUp', upload.single('avatar'), userCtrl.signUp)
	app.post('/api/users/signIn', userCtrl.signIn)
}
