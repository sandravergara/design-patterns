/** Secure Ether Transfer*/
/** Ref. (Consensys) Cruz, LF. Ethereum Development(powerpoint) 2018 */
/** Use Cases - Remittances */


pragma solidity 0.4.22;


contract MoneyTransfer {
    
  
   address sender; //set as the owner of the contract
   address receiver; //set who is the receiver
   uint balance; //set the balance of sender
   uint balanceR; //set the balance of receiver
   uint amount; //set the amount of money to be transfer
   
   //set the sender as the owner of contract
   constructor() public {
       
       sender = msg.sender;
   }
   

   //set the address of receiver
   function setReceiver(address _receiver) public {
       
       receiver = _receiver;
       
   }
   
   
   //setting of balance of sender
   function setBalanceOfSender(uint _balance) public{
       
       balance = _balance;
   }
   
   //sender will send amount to receiver /** Secure Ether transfer */
   function sendAmount(uint _amount) public payable {
       
       require(sender.send(_amount));
       require(sender.call.value(_amount).gas(35000)());
       receiver.transfer(_amount);
       
       if(balance >= _amount){
           
           balance -= _amount;
           balanceR += _amount;
     
       } else{
           
           revert();
       }
   }
   
   //get the sender balance
    function getSenderBalance()view public returns(uint) {
       
       return(balance);
   }
   
   //get the  receiver address
   function getReceiverInfo()view public returns(address, uint) {
       
       return(receiver, balanceR);
   }
   
   
}