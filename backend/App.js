var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');

var foods = require('./routes/food');
var categories = require('./routes/category');
var orders = require('./routes/order');

//
var app = express();

//
app.use(express.static('image'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());

//
mongoose
  .connect('mongodb://127.0.0.1/foodDB', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log('Successfully connected to the database');
  })
  .catch((err) => {
    console.log('Could not connect to the database. Exiting now...', err);
    process.exit();
  });

//
app.use('/api/food', foods);
app.use('/api/categories', categories);
app.use('/api/orders', orders);
const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server is working on http://localhost:${port}`);
});
