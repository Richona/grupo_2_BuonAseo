

const {addCart,list,removeCart} = require('../../controllers/api/apiCartController');

const router = require('express').Router();


/* /api/apiCart */

router
    .get('/',  list)
    .post('/',  addCart)
    .delete('/:id',  removeCart)
    


module.exports = router