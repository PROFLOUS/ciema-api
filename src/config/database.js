const Sequelize = require("sequelize");
require("dotenv").config();
const sequelize = new Sequelize(
  process.env.MYSQL_DATABASE,
  "root",
  process.env.MYSQL_ROOT_PASSWORD,
  {
    host: "localhost",
    dialect: "mysql",
    logging: false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000,
    },
  }
);

sequelize
  .authenticate()
  .then(() => {
    console.log("Connection has been established successfully.");
  })
  .catch((error) => {
    console.error("Unable to connect to the database: ", error);
  });

//  sequelize.sync({force: false}).then(() => {
//     console.log("Database & tables created!");
// });
module.exports = sequelize;
