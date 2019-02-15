
/** 
    Factory Contract Pattern
    Use Case - Car Asset for banking
    Reference: https://medium.com/@i6mi6/solidty-smart-contracts-design-patterns-ecfa3b1e9784
    Author: Vitanov, A. February 25, 2018
    
*/

STEP 1: Copy this whole code.
STEP 2: Go to https://remix.ethereum.org/
STEP 3: On the upper left side of the website of RemixIDE
    click the plus sign.
STEP 3.1
    In the Filename change it to the Name "Factory.sol"
STEP 4: Paste the code in the editor.
STEP 5: In the Upper right side of the website choose the Compiler Version 0.4.19+commit.4cb486ee.
STEP 6: Press "Start to Compile"
STEP 7: After you compile, go to the Run tab section, Make sure to check your Environment and Select Javascipt VM.
STEP 8: Click Deploy
STEP 9: In createChildContract, put your assets the in between of double quote eg.["TOYOTA", "VIOS"] then click the button beside the textbox.
STEP 10: click the getDeployedChildContract, after you click that you will see the address of your assets. To check it Deploy the CarAssetContract.
STEP 11: Deploy the CarAssetContract.
STEP 12: To see your assets. Click the corresponding button to see the data in your Brand, Model and your address.