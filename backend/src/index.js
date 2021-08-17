const app = require("./app");
const { connect } = require("./database");

const main = async () => {
    // Database connection
    await connect(); 


    // Express Application
    await app.listen(8080);
    console.log('Server on port 8080: Connected');
}

main(); 