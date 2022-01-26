const express = require('express');
const router = express.Router();
const controlador = require('../controllers/ns');

//PRINCIPAL
router.get('/', (req, res) => {
    res.render('inteprin');
});

router.post('/', (req, res) => {
    res.render('inteprin');
});

//CRUD
router.get('/interfaz.hbs', (req, res)=> {
    res.render('interfaz');
});
router.post('/interfaz.hbs', controlador.interfaz);

//CRUD2
router.get('/interfaz2.hbs', (req, res)=> {
    res.render('interfaz2');
});
router.post('/interfaz2.hbs', controlador.interfaz2);

//TRANSACCION1
router.get('/interfaz3.hbs', controlador.constras1);
router.post('/interfaz3.hbs', controlador.actu1);

//TRANSACCION2
router.get('/interfaz4.hbs', controlador.constras2);
router.post('/interfaz4.hbs', controlador.actu2);

module.exports = router;
 
