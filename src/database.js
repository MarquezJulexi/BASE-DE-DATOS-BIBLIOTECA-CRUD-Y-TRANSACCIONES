const {Client, Pool} = require('pg');

const {database} = require('./keys');

const db  = new Pool(database);

module.exports=db;