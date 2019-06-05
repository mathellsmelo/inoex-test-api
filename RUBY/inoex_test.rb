require 'minitest/autorun'
require_relative './inoex'

class Inoex_Test < Minitest::Test
    
    #Teste de Requisição!
    def test_req
        tx = Inoex.new('f559581fbebb412b9379cd5752bcae49', 'C3qXd3YYRBrZZod5D9GLGhpDNnVfAwpbe2', 10000000).postReq
        res = Inoex.new('f559581fbebb412b9379cd5752bcae49', 'C3qXd3YYRBrZZod5D9GLGhpDNnVfAwpbe2', 10000000).getReq(tx)
        assert_equal tx, res
    end

end