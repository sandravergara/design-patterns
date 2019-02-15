// Name Registry with Delete Registry


pragma solidity >=0.4.0 <=0.5.0;

contract NameRegistry{
struct ContractDetails{

       address owner;
       address contractAddress;
   }

   mapping(string => ContractDetails)registry;

   //Input a name to  register into a registryName
   //in sting it must a letters
   // in address it must be the account in the upper right box
   function registryName(string _name, address _addr)public{

       ContractDetails memory info = registry[_name];
       require(info.owner == address(0) || info.owner == msg.sender);
       info.owner = msg.sender;
       info.contractAddress = _addr;
       registry[_name]=info;

   }
   //In this function you must type the name that you have enter to search the address
   function getContractAddress(string _name) public returns(address){
       return registry[_name].contractAddress;
   }
   //In this function you must type again the name and address to delete it in the registry
   function deleteRegistry(string _name, address _addr)external {
       delete(registry[_name]);


   }


}