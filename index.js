const axios = require('axios');
const api = axios.create({
    baseURL: 'https://api.blockcypher.com/v1/bcy/test'
});

main();

function main () {
    const address = 'C3qXd3YYRBrZZod5D9GLGhpDNnVfAwpbe2';
    const amount = 1;
    const token = 'f559581fbebb412b9379cd5752bcae49';
    api.post(`/faucet?token=${token}`, {
        address, 
        amount
    }).then(res => {
        console.log(res.data);
    }).catch(err => {
        console.log(err.response.data.error);
    });
}


