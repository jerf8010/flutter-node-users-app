
const mongoose = require('mongoose');


const connect = async () => {
    await mongoose.connect('mongodb://localhost/flutter-node-tutorial', {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true,
        useFindAndModify: false,
    });
    console.log('Database: connected');
}

module.exports = { 
    connect 
};