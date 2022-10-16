'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Gender extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Gender.belongsTo(models.User,{
        as : 'user',
        foreignKey : 'id_gender'
      })
    }
  }
  Gender.init({
    name: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Gender',
    paranoid : true
  });
  return Gender;
};