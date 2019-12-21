require_relative '../../app/bank'

describe ContaCorrente do
  describe 'Saque' do
    context 'quando o valor é positivo' do
      before(:all) do
        @conta_corrente = ContaCorrente.new(1000.00)
        @conta_corrente.saca(200.00)
      end
      it "entao atualiza saldo" do
        expect(@conta_corrente.saldo).to eql 795.00
      end
    end
    context 'quando o saldo é insuficiente' do
      before(:all) do
        @conta_corrente = ContaCorrente.new(0.00)
        @conta_corrente.saca(100.00)
      end
      it 'então exibe mensagem' do
        expect(@conta_corrente.mensagem).to eql 'Saldo insuficiente para o saque'
      end
      it 'e o saldo final com zeros' do
        expect(@conta_corrente.saldo).to eql 0.00
      end
    end
    
    context 'quando o saldo e zero' do
      before(:all) do
        @conta_corrente = ContaCorrente.new(100.00)
        @conta_corrente.saca(101.00)
      end
      it 'então exibe mensagem' do
        expect(@conta_corrente.mensagem).to eql 'Saldo insuficiente para o saque'
      end
      it 'e o saaldo permanece' do
        expect(@conta_corrente.saldo).to eql 100.00
      end
    end
    
    context 'quando supera o limite de saque' do
      before(:all) do
        @conta_corrente = ContaCorrente.new(1000.00)
        @conta_corrente.saca(701.00)
      end
      it 'entao exibe mensagem' do
        expect(@conta_corrente.mensagem).to eql 'Limite maximo para saque e 700'
      end
      it 'e o saldo permanece' do
        expect(@conta_corrente.saldo).to eql 1000.00
      end
    end
  end
end
