module.exports = (sequelize, dataTypes) => {
	let alias = 'products';

	let columns = {
		id: {
			type: dataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		name: dataTypes.STRING,
		price: dataTypes.INTEGER,
		image: dataTypes.STRING,
		userId: dataTypes.INTEGER,
		brandId: dataTypes.INTEGER
	};
	
	// let config = {
	// 	// timestamps: false,
	// 	// tableName: 'productos'
	// 	scopes: {
	// 		isActive: {
	// 			where: {
	// 				isActive: 1
	// 			}
	// 		}
	// 	}
	// };

	const product = sequelize.define(alias, columns);

	product.associate = models => {
		// belongsTo
		product.belongsTo(models.brands, {
			foreignKey: 'brandId',
			as: 'brand'
		});

		// belongsToMany
		product.belongsToMany(models.categories, {
			foreignKey: 'productId',
			otherKey: 'categoryId',
			through: 'category_product',
			as: 'categories',
		});
	}

	product.prototype.getNameAndPrice = function () {
		return '*** '+ this.name + ' === ' + this.price + ' ***';
	}

	return product;
}