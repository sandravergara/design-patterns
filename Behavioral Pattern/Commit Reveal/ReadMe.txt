CommitRevealElection.sol
Use Case: Elections
Design Pattern: Commit-Reveal

/**Resources:	Presentation:"ConsenSys Academy PowerPoint"
		Title of the PowerPoint: "Blockchain For Developers, Ethereum Developer"
		Author of the PowerPoint: "Cruz, L. F., Vivas, C., Au, S., 2018"
		URL:"https://eprints.cs.univie.ac.at/5665/1/bare_conf.pdf" 	
		Research Paper Title: "Design Patterns for Smart Contracts in the Ethereum Ecosystem"
		Author: "Wohrer, M., Zdun, U., 2018" */

STEPS:

1. Open your browser and go to https://remix.ethereum.org/
2. Create a new solidity file and name it "CommitRevealElection.sol"
3. Open the ReadMe.txt file, copy the source code and paste it.
4. Before you start to compile, set a compatible version for the solidity file that is same with in the code. You can find the version on right side "Select new compiler version". 
5. Click Start to compile.
6. After compiling, click Run on the upper right side. Make sure that the following is set correctly:
	Environment: JavaScript VM
	Account: (Choose any account)
	Gas Limit: 3000000
	Value: ether
7. Before deploying, click the drop down button besides of deply and fill up the textfields. It contains the time of the contract and the names of the elect in elections. Then click Deploy
8. Once you deployed, fill up the commitVote to vote. First, you need to open the link "https://emn178.github.io/online-tools/keccak_256.html" to convert the input words to hash.
9. Once you get the hash, copy and paste it on commitVote. To vote you must enter 1,2,3,4 etc. on the start to determine the elect names.
10. When the time is finished, click the revealVote to reveal what the voters vote with the hash.
11. After that click getWinner to reveal who is the winner in the election
12. You can view the number of votes by click numberOfVotesCast.
