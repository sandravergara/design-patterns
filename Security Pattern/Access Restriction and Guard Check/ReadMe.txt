Steps: 

Step 1. Go to this site (http://remix.ethereum.org/#optimize=false&version=soljson-v0.4.25+commit.59dbf8f1.js)
Step 2. Click the folder icon, second from the top left and Browse the MedicalRecord.sol
Step 3. Click the browser then open MedicalRecord.sol
Step 4. Click compile(top right) and then click Start to compile and wait untill MedicalRecord show up with Green box. It means we're good to go.
Step 5. From top right click Run make sure the JavaScript VM is selected in Environment and then click Deploy.
Step 6. Then look at the Deployed Contracts and click the MedicalRecord at 0x0125...55b8a it maybe different to yours.
	You will see 3 red box and 1 grey box 
	The first 3 box is 
	addHospital -> this is used for adding a hospital so they can become authorized and be able to add patient.
Step 7. Click the account the 0xca3...a733c and then choose another account and then click the first icon at the ending row 
Step 8. Click again the account and choose 0xca3...a733c...
sTEO 9. Open the down arrow at the end of add hospital paste the address to _accountAddress and then fill up _hospitalName and _hospitalAddress then click transact.
Step 10. Now go back to account and choose the address that you have chosen earlier then click addPatient, click the down arrow and fill up those fields then transact to add new patient
	 to view update patient just click the updatePatient and do the same in addPatient fill up those fields
Step 11. To get the Patient history fill up the field and take note that the inputs are case sensitive 

Note: getPatientHistoryV2 supposed to be in Web function thats why we need to put the historyIndex manually so in our case we should put 0 for first history.




