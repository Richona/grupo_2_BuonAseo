const { check, body } = require('express-validator');

const { cargarUsers } = require('../../data/db_users/db_users');
const db = require("../../database/models");


module.exports = [
    check('name')
        .notEmpty().withMessage('El nombre es obligatorio').bail()
        .isLength({
            min: 2
        }).withMessage('Mínimo 2 caracteres').bail()
        .isAlpha('es-ES').withMessage('Solo caracteres alfabéticos').bail()
        /* .custom( async (value, { req }) => {
            await db.User.findOne({
                where: {
                    name: value
                },
                attributes: ["id"]
            })
                .then(user => {
                    console.log(user)
                    if (user) {
                        return false
                    } else {
                        return true
                    }
                })
                .catch(error => console.log(error))
        }).withMessage('El nombre ya existe. Por favor, selecciona otro.') */,
    body('email')
        .notEmpty().withMessage('El email es obligatorio').bail()
        .isEmail().withMessage('Debe ser un email válido').bail()
        /* .custom((value, { req }) => {
            const user = cargarUsers().find(user => user.email === value);
            
            if (user) {
                return false
            } else {
                return true
            }
        }).withMessage('El email ya se encuentra registrado') */,

    check('password')
        .notEmpty().withMessage('La contraseña es obligatoria').bail()
        .isLength({
            min: 6,
            max: 12
        }).withMessage('La contraseña debe tener entre 6 y 12 caracteres'),

    body('password2')
        .notEmpty().withMessage('Debes confirmar la contraseña').bail()
        .custom((value, { req }) => {
            if (value !== req.body.password) {
                return false
            }
            return true
        }).withMessage('Las contraseñas no coinciden')

]