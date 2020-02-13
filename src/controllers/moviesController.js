module.exports = {
	index: (req, res) => {
		res.send('Index');
	},
	
	show: (req, res) => {
		res.send('Detail');
	},
	
	create: (req, res) => {
		res.send('Create');
	},
	
	store: (req, res) => {
		res.send('Store');
	},

	edit: (req, res) => {
		res.send('Edit');
	},
	
	update: (req, res) => {
		res.send('Update');
	},
	
	destroy: (req, res) => {
		res.send('Destroy');
	},
}