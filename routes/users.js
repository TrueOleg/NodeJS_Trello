const express = require('express');
const router = express.Router();

const { sequelize } = require('../models/sequelize');
const models = require('../models/sequelize');
const auth = require('../helpers/auth');

const verify = auth.verifyToken;
const Op =sequelize.Op;
const fn = sequelize.fn;
const col = sequelize.col;
const where = sequelize.where;
router.get('/search', verify, async (req, res, next) => {
    try {
        const userName = req.query.char;
        const myId = req._userId;
        const users  = await models.Users.findAll({ 
            attributes: ['id', 'name'],
            where: {
                [Op.and]: {
                    name: {
                        [Op.iLike]: `${userName}` + '%',
    
                    },
                    id: {
                        [Op.not]: myId
                    }
                },
            },
            raw: true, 
            include: {
                as: 'Following',
                [Op.eq]: null,
                model: models.Users,
                where: where(col('follower'), myId),
                raw: true   
            }
             
        });
        res.status(200).send({
        message: 'success',
        result: true,
        users
        });     
    }
    catch(err) {
        next(new Error(err.message));
    }
});

module.exports = router;