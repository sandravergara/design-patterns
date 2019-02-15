
MoneyTransfer.sol (Sending Ether Transfer)

Steps: 
1. Go to https://remix.ethereum.org/
2. Create new .sol File from remix (located at upper left corner, (+) sign)
3. Change compiler version to 0.4.22+commit.......
4. Start to compile(Ctrl-S)
5. Go to run tab
	5.1 Change the Environment box to Javascript VM
6. Deploy
(Now you can see another tab from left down of your screen)
Money transfer Contracts)


Follow this steps to use the contract properly

1. GO to Account tab (located at the bottom of enviroment tab)
2. Copy the account by clicking the copy button, 2nd to the last of account tab
3. Paste the copied account to setReceiver button with "" between it
	ex: "0x14723a09acff6d2a60dcdf7aa4aff308fddc160c"
4. After that, click the setReceiver button
5. Now you can click the getReceiverInfo and you will see the address you copied on it
6.Now, set the balance of sender(Same procedure as number 4 .
	ex: 250
7. Now you can click the getSenderBalance and you will see the balance you entered.
8. Now. set an amount you will send to receiver and it will be deducted to senderbalance automatically
9. Enter amount to be sent
	ex: 50 , (before that, you must set a value as 1 and change the wei to ether) after that you can click now the sendAmount Button to finish the transaction
10. As you finish to do it, you can click the getReceiverInfo that it has an amount that you will sent to them and the getSenderBalance has been deducted.