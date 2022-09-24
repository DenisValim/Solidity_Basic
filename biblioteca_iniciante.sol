//*


*/

pragma solidity 0.5.3


library SafeMath {

	// Função de adição
	function add(unit a, unit b) internal pure returns(unit) {
		unit c = a + b;
		require (c >= a, "Sum Underflow");

		return c;
	}
	// Função de subtração
	function sub(unit a, unit b) internal pure returns(unit) {
		require (b <= a, "Sub Underflow");
		unit c = a - b;

		return c;
	}
	// Função de multiplicação
	function mul(unit a, unit b) internal pure returns(unit) {
		if(a == 0) {
			return 0;
		}
		unit c = a * b;
		require (c / a == b, "Mult Overflow");
		
		return c;
	}
	// Função de divisão
	function div(unit a, unit b) internal pure returns(unit) {
		unit c = a / b;
		
		return c;
	}
  
}

contract ownable{
address payable	public owned;
	event OwnershipTransferred(address newOwner);

	constructor() public {
		owned = msg.sender;
	}
	modifier onlyOwner() { 
		require (msg.sender == owned, "You are not owner!"); 
		_; 
	}
	function transferOwnership(address payable newOwner) onlyOwner public{
		owner = newOwner;
		emit OwnershipTransferred(Owner);
	}

}


contract biblioteca {
	using SafeMath for unit;	
	
	


	function sumStored(unit a) public view returns(unit){

		return a.sum(b);
	}

	// Padrão da reentrança
	    function withdraw() public{

	        require(balances[msg.sender] > 0, "Insufficient funds");// verifica se tem saldo

	        uint amount = balances[msg.sender];// variavel  para  impedir que hack de valor 
	        balances[msg.sender] = 0;
	        msg.sender.transfer(amount);
	        
	    }
}