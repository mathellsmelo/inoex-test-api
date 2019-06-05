require 'rubygems'
require 'rest_client'
require 'uri'
require 'json'

# PELO QUE LI NA API, 10000000 DE SATOSHIS = 0,1 BITCOIN 
# NÃO ENCONTREI O VALOR EM BCY

class Inoex

    def initialize(token, address, amount)
        @token = token
        @address = address
        @amount = amount
    end

    def sendBCY
        #CONSTRUÇÃO DA REQ POST
        tx = postReq
        #CONSTRUÇÃO DA REQ GET
        res = getReq(tx)
        
        if tx == res then
            print('Success')
        else 
            print('Failed')
        end

    end 

    def postReq
        url = "https://api.blockcypher.com/v1/bcy/test/faucet?token=#{@token}"
        params = {
            address: @address,
            amount: @amount      
        }.to_json

        response = RestClient.post(url, params)
        result = JSON.parse(response.body)
        
        #RESPOSTA
        tx = result['tx_ref']
        return tx
    end

    def getReq(tx)
        response = RestClient.get("https://api.blockcypher.com/v1/bcy/test/txs/#{tx}", 
            {
                "Content-Type" => "application/json",
            }
        ) 
        #RESPOSTA
        data = JSON.parse response.body
        hash = data['hash']
        res = data['outputs'][0]
        
        resAmount = res['value']
        resAddress = res['addresses'][0]
        return hash
    end

end

Inoex.new('f559581fbebb412b9379cd5752bcae49', 'C3qXd3YYRBrZZod5D9GLGhpDNnVfAwpbe2', 10000000).sendBCY