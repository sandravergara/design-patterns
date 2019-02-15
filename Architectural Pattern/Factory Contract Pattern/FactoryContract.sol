
/** 
    Factory Contract Pattern
    Use Case - Car Asset for banking
    Reference: https://medium.com/@i6mi6/solidty-smart-contracts-design-patterns-ecfa3b1e9784
    Author: Vitanov, A. February 25, 2018
    


*/

//Main Contract

pragma solidity 0.4.24;

contract Factory {
    
    
    //Connection between Contract and Asset (which is the child contract)
    address [] carAssets;

    //Declaring the child contract what was the asset of owner
    function createChildContract(string carBrand, string carModel) public payable {
        
        //makes a transaction w/c deploys the child contract and return the address/owner
        address newCarAsset = new CarAsset(carBrand, carModel, msg.sender);
        
        //stores the inputted data from createChildContract
        carAssets.push(newCarAsset);
        
    }
    
    //Declaring getDeployedChildContracts and get the address ow the owner by clicking on it
    function getDeployedChildContracts() public view returns(address[]) {
        
        return carAssets;
    }
    
}


//Assets Contract 

contract CarAsset {
    
    string public carBrand; //Declaring brand of Assets
    string public carModel; //Declaring model of Assets
    address public owner; //Declaring address of owner;
    address verify;
    
    //show the ddeclared asset such as brand and model from Main contract
    function CarAsset(string _brand, string _model, address _owner) public {
        
        carBrand = _brand; 
        carModel = _model; 
        owner = _owner;
    }
    
    function verifyAddress(address _verify) view public returns(bool) {
        
        verify = _verify;
        
         return (keccak256(owner) == keccak256(_verify));
    }
}

