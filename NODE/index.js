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
        //console.log(res.data.tx_ref);
        get(res.data.tx_ref);
    }).catch(err => {
        console.log(err.response.data.error);
    });
}

function get(tx){
    api.get(`/txs/${tx}`).then(res => {
        //console.log(res.data.hash);
        if(tx === res.data.hash){
            console.log("Success");
        }else {
            console.log("Failed");
        }
    }).catch(err => {
        console.log(err);
    });
}


