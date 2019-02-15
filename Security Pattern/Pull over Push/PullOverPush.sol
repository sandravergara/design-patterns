/** Pull over push */


pragma solidity 0.4.22;

contract PullOverPush {
    
   address value; //initalize the value as address

   mapping(address => uint) credits; 
   
   
    //set value as owner of contract
   function PullOverPush() public payable {
       value = msg.sender;
   }

    //set the address and amount for receiver
   function allowForPull(address receiver, uint amount) payable public {
       credits[receiver] += amount;
   }
    
    
    //for withdraw eth from account address
   function withdrawCredits() payable public {
       uint amount = credits[msg.sender];

       require(amount != 0);
       require(address(this).balance >= amount);

       credits[msg.sender] = 0;

       msg.sender.transfer(amount);
   }
}