// require('dotenv').config();
// const inquirer = require('inquirer');
const mysql = require('mysql');
// const connection = mysql.createConnection({
//     host: process.env.DB_host,
//     port: process.env.DB_port,
//     user: process.env.DB_user,
//     password: process.env.DB_password,
//     database: process.env.DB_database
// });

const connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "",
    database: "bamazon"
});

// connect to the mysql server and sql database
connection.connect(function(err) {
    if (err) throw err;
    displayProducts();
});

function displayProducts() {
    connection.query("SELECT * FROM products", function(err, res) {
        if (err) throw err;
        for (var i = 0; i < res.length; i++) {
            console.log('------------------------------------------------------------------------------------------------');
            console.log('ID#: ' + res[i].id + ' | ' + 'Product: ' + res[i].product_name + ' | ' + 'Price: ' + res[i].price);
            console.log('------------------------------------------------------------------------------------------------');
        }
    });
};
