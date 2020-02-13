const db = require('../database/models/');
const Products = db.products;
const Brands = db.brands;
const Categories = db.categories;
// const {products: Products}= db;

module.exports = {
	index: (req, res) => {
		Products
			.findAll({
				include: ['brand']	
			})
			.then(products => {
				return res.render('products/index', {
					products
				});
			})
			.catch(error => res.send(error));
	},
	
	show: (req, res) => {
		Products
			.findByPk(req.params.id, {
				include: ['categories', 'brand']
			})
			.then(product => {
				return res.render('products/detail', {
					product
				});
			})
			.catch(error => res.send(error));
	},
	
	create: async (req, res) => {
		let brands = await Brands.findAll();
		let categories = await Categories.findAll();

		return res.render('products/create', { brands, categories });
	},
	
	store: (req, res) => {
		req.body.userId = 3;

		Products
			.create(req.body)
			.then(productSaved => {
				// Impacta la tabla pivot "category_product"
				productSaved.addCategories(req.body.categories);
				return res.redirect('/products');
			})
			.catch(error => res.send(error));
	},

	edit: (req, res) => {
		res.send('Edit');
	},
	
	update: (req, res) => {
		// return res.send('Update');
		
		Products
			.findByPk(req.params.id, {
				include: ['categories']
			})
			.then(product => {
				product.removeCategories(product.categories);
				productSaved.addCategories(req.body.categories);
				product.save();
				return res.redirect('/products');
			})
			.catch(error => res.send(error));
	},
	
	destroy: (req, res) => {
		Products
			.findByPk(req.params.id, {
				include: ['categories']
			})
			.then(product => {
				product.removeCategories(product.categories);
				product.destroy();
				return res.redirect('/products');
			})
			.catch(error => res.send(error));
	},
}