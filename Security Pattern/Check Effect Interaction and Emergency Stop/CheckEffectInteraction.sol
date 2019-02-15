/** Ref. (Consensys) Cruz, LF. Ethereum Development(powerpoint) 2018 */
/** Use Case Withdraw and Deposit */

pragma solidity 0.4.22;
// ChecksEffectInteractions and Emergency Stop
contract ChecksEffectInteractions {
    
    address owner;
    bool isStopped = false;
    
    constructor() public {
        owner = msg.sender;
    }
    
    mapping(address => uint) public balance;   
    function deposit(uint _amount) public payable {
        
        if(isStopped) {
            stopContract(); //call function stopContract() to stop the contract
        } else {
            require(msg.value == _amount);
            balance[msg.sender] += _amount; // add account balance value from input deposit    
        }
    }
        
    function withdraw(uint _amount) public {
        
        if(isStopped) {
            stopContract();
        } else {
            require(_amount <= balance[msg.sender]);
            balance[msg.sender] -= _amount; // subtract account balance value from input withdraw
            msg.sender.transfer(_amount);
        }
    }
    
    // -------------------------------------------
    
    function stopContract() public {
        require(msg.sender == owner);
        isStopped = true; // stop contract method
    }
    
    function resumeContract() public {
        require(msg.sender == owner);
        isStopped = false; //resume contract method
    }

}