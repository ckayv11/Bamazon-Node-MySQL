require('dotenv').config();
const inquirer = require('inquirer');
const mysql = require('mysql');
const connection = mysql.createConnection({
    host: process.env.DB_host,
    port: process.env.DB_port,
    user: process.env.DB_user,
    password: process.env.DB_password,
    database: process.env.DB_database
});

// connect to the mysql server and sql database
connection.connect(function(err) {
    if (err) throw err;
    displayProducts();
});

function displayProducts() {
    connection.query("SELECT * FROM products", function(err, res) {
        if (err) throw err;
        console.log("Welcome to Bamazon! Check out our Top 10 products for sale this week!");
        console.log("");
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].id + ' | ' + res[i].product_name + ' | ' + 'Price: $' + res[i].price);
        }
        console.log("");
        selectProduct();
    });
};

// Function to ask the customer for the ID# & quantity of the product they would like to purchase.
function selectProduct() {
    inquirer
    .prompt([
      {
        name: 'productID',
        type: 'input',
        message: 'Please enter the ID# of the product you want to buy.',
        validate: function(value) {
            if (isNaN(value) === false) {
              return true;
            }
            return ('Please enter a valid number for the item ID.');
          }
      },
      {
        name: 'quantity',
        type: 'input',
        message: 'Please enter the quantity you want to purchase.',
        validate: function(value2) {
            if (isNaN(value2) === false) {
              return true;
            }
            return ('Please enter a valid number for the quantity.');
          }
      }
    ])
    .then(function(answer) {
        connection.query(`SELECT * FROM products WHERE id = ${answer.productID}`, function(err, res) {
            if (err) throw err;
            let selectQty = answer.quantity;
            let productName = res[0].product_name;
            let purchaseCost = selectQty * res[0].price;
                if (selectQty <= res[0].stock_quantity) {
                    let remainingQty = res[0].stock_quantity - answer.quantity;
                    connection.query(`UPDATE products SET ? WHERE ?`,
                    [
                      {
                          stock_quantity: remainingQty
                      },
                      {
                          id: answer.productID
                      }
                    ],
                    function(err, res) {
                        if (err) throw err;
                        console.log(`You purchased ${selectQty} of ${productName} and your total cost was $${purchaseCost}. Thank you for shopping at Bamazon!`);
                    });
                } else if (selectQty > res[0].stock_quantity) {
                    console.log('Insufficient quantity! Please select a different product or quantity.')
                    selectProduct();
                };
        });
    });
};
