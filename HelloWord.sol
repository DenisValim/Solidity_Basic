pragma solidity 0.5.3;

contract HelloWord {
    string public text;
    uint public number;
    address public userAddress;
    bool public answer;
    mapping (address => uint) public hasInteracted;
    mapping (address => uint) public balances;

    function setText(string memory myText) public {
        text = myText;
        setInteracted();
    }

    function setNumber(uint myNumber) public payable {
        require (msg.value >=  1 ether, "Insufficient ETH sent.");
        balances[msg.sender] += msg.value;
        number = myNumber;
        setInteracted();
    }

    function setUserAddress() public {
        userAddress = msg.sender;
        setInteracted();
    }

    function sendETH(address payable TargetAddress) public payable{
      TargetAddress.transfer(msg.value);  
    }
    // Padrão da reentrança
    function withdraw() public{

        require(balances[msg.sender] > 0, "Insufficient funds");// verifica se tem saldo

        uint amount = balances[msg.sender];// variavel  para  impedir que hack de valor 
        balances[msg.sender] = 0;
        msg.sender.transfer(amount);
        
    }


    function setAnswer (bool TrueorFalse) public {
        answer = TrueorFalse;
        setInteracted();
    }

    function setInteracted() private {
        hasInteracted[msg.sender] += 1;
    }
    function sum(uint num1, uint num2) public pure returns(uint){
        return num1 + num2;
    }

    function sub(uint num1, uint num2) public pure returns(uint){
        return num1 - num2;
    }

    function mult(uint num1, uint num2) public pure returns(uint){
        return num1 * num2;
    }

    function div(uint num1, uint num2) public pure returns(uint){
        return num1 / num2;
    }

    function pow(uint num1, uint num2) public pure returns(uint){
        return num1 ** num2;
    }

    function sumStored(uint num1) public view returns(uint){
        return num1 + number;
    }

}