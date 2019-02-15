pragma solidity >=0.4.0 <=0.5.0;

contract Random{
         string name;
         string homeAdd;
         string mensahe;
         uint age;
//reciver
         address trustedPerson = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
//INPUT THE CONTENTS
   function sendMessage(string _name, string _homeAdd, uint _age, string _mensahe, address _trustedPerson)public {
       //CONTENTES
       name = _name;
       homeAdd = _homeAdd;
       age = _age;
       mensahe = _mensahe;
       trustedPerson = _trustedPerson;

   }

   function sendMensahe() public view returns(string, string, uint, string, address){
       return(name,homeAdd,age,mensahe,trustedPerson);

   }
    //AFTER INPUTTING THE CONTENTS PASTE IT AGAIN.
   function getHash(string _name, string _homeAdd, uint _age, string _mensahe, address _trustedPerson)public view returns (uint256){
        return uint256(keccak256(_name, block.timestamp, block.difficulty));


  }




















}