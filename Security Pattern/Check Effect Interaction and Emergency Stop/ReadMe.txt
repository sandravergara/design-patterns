ChecksEffectInteractions.sol
Use Case: Withdrawal and Deposit for Banks
Security Pattern: Check Effect Interactions and Emergency Stop

Steps: 

1. Open your browser and go to https://remix.ethereum.org/
2. Create a new solidity file and name it "ChecksEffectInteractions.sol"
3. Open the ReadMe.txt file, copy the source code and paste it.
4. Before you start to compile, set a compatible version for the solidity file that is same with in the code. You can find the version on right side "Select new compiler version". 
5. Click Start to compile.
6. After compiling, click Run on the upper right side. Make sure that the following is set correctly:
	Environment: JavaScript VM
	Account: (Choose any account)
	Gas Limit: 3000000
	Value: ether
7. Once you successfully finish step 6, click Deploy.
8. Click the Deployed Contracts, you can see the methods that is in source code.
9. First you must input deposit amount, make sure you have value on ether. Then click deposit.
10. To check the input deposit, you must enter your address that is in the Account and paste it in balance text field. Then click balance to see balance.
11. If you want to withdraw, just enter the amount that you want and click withdraw, you can check you balance if withdraw is success.
12. On stopContract, you can stop your contract.
13. On resumeContract, you can resume your contract and continue in the process. 
