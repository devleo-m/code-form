import 'dotenv/config'
import { Options } from 'sequelize';

const { DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME } = process.env

const config: Options = {
  username: DB_USERNAME,
  password: DB_PASSWORD,
  database: DB_NAME,
  host: DB_HOST,
  port: 5433,
  dialect: "postgres",
  logging: console.log,
  dialectOptions: {
    connectTimeout: 10000, // 10 segundos
  }
};

export = config;