const express = require('express');
const router = express.Router();

/*====== Controller ======*/ 
const controller = require('../controllers/productsController');

// Listado - GET
router.get('/', controller.index);

// Creación - GET - create
router.get('/create', controller.create);

// Creación - POST - create
router.post('/create', controller.store);

// Edición - GET - edit
router.get('/edit/:id', controller.edit);

// Edición - PATCH - update
router.patch('/edit/:id', controller.update);

// Eliminar - DELETE - destroy
router.delete('/:id', controller.destroy);

// Detalle - GET - show
router.get('/:id', controller.show);

module.exports = router;
