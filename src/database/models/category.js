module.exports = (sequelize, dataTypes) => {
	let alias = 'categories';

	let columns = {
		id: {
			type: dataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true,
			allowNull: false
		},
		name: dataTypes.STRING,
	};

	const category = sequelize.define(alias, columns);

	return category;
}