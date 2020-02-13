module.exports = (sequelize, dataTypes) => {
	let alias = 'brands';

	let columns = {
		id: {
			type: dataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		name: dataTypes.STRING,
	};

	const brand = sequelize.define(alias, columns);

	return brand;
}