pragma solidity ^0.4.24;

contract MedicalRecord {

    modifier isOwner {
        require(owner == msg.sender, "You are not the owner!");
        _;
    }

    modifier isAuthorized {
        require(mapHospital[msg.sender].isAuthorized, "You are not Authorized!");
        _;
    }

    address owner;

    struct Hospital {
        address accountAddress;
        string hospitalName;
        string hostpitalAddress;
        bool isAuthorized;
        bool isOccupied;
    }

    struct Patient {
        uint historyCounter;
        string firstName;
        string lastName;
        string middleName;
        string birthDate;
        mapping(uint => History) mapHistory;
        bool isExist;
    }

    struct History {
        string hospitalName;
        string lastAttended; //Timestamp
        string findings;
        string doctorName;
    }

    mapping(address => Hospital) mapHospital;
    mapping(bytes32 => Patient) mapPatient;

    constructor() public payable{
        owner = msg.sender;

    }

    function addHospital(address _accountAddress, string _hospitalName, string _hospitalAddress) public isOwner returns(string){
        require(!mapHospital[_accountAddress].isOccupied, "Hospital already exist!");

        Hospital memory newHospital;
        newHospital.accountAddress = _accountAddress;
        newHospital.hospitalName = _hospitalName;
        newHospital.hostpitalAddress = _hospitalAddress;
        newHospital.isAuthorized = true;
        newHospital.isOccupied = true;

        //Add new hospital to mapping
        mapHospital[_accountAddress] = newHospital;

        return 'New hospital added!';
    }

    function addPatient(string _firstName, string _middleName, string _lastName, string _birthDate, string  _hospitalName, string _lastAttended, string _findings, string _doctorName ) public isAuthorized returns(string, uint) {
        // Convert First Name, Last Name, Middle Name and Birthday to a single hash for Patient ID
        bytes32 patientId = sha256(abi.encodePacked(_firstName, _lastName, _middleName, _birthDate));
        // Check if Patient Exist
        require(!isExist(patientId), "Patient already exist!");
        if(bytes(_firstName).length == 0 || bytes(_middleName).length == 0 || bytes(_lastName).length == 0 || bytes(_birthDate).length == 0 || bytes(_hospitalName).length  == 0 || bytes(_lastAttended).length == 0 || bytes(_findings).length == 0 || bytes(_doctorName).length == 0){
            revert("All fields are required");
        }

        Patient memory newPatient;
        newPatient.firstName = _firstName;
        newPatient.middleName = _middleName;
        newPatient.lastName = _lastName;
        newPatient.birthDate = _birthDate;
        newPatient.isExist = true;

        History memory newHistory;
        newHistory.hospitalName = _hospitalName;
        newHistory.lastAttended= _lastAttended;
        newHistory.findings = _findings;
        newHistory.doctorName = _doctorName;

        // Saving to mapping...
        mapPatient[patientId] = newPatient; // Insert patient to mapping
        mapPatient[patientId].mapHistory[0] = newHistory; // Insert new History to Patient->History
        mapPatient[patientId].historyCounter++; // Increase the number of history

        return ('New patient added!', mapPatient[patientId].historyCounter);
    }

    function updatePatient(string _firstName, string _middleName, string _lastName, string _birthDate, string _hospitalName, string _lastAttended, string _findings, string _doctorName) public isAuthorized returns (string, uint){
        // Convert First Name, Last Name, Middle Name and Birthday to a single hash for Patient ID
        bytes32 patientId = sha256(abi.encodePacked(_firstName, _lastName, _middleName, _birthDate));
        // Check if Patient Exist
        require(isExist(patientId), "Patient doesn\'t exist!");
        if(bytes(_firstName).length == 0 || bytes(_middleName).length == 0 || bytes(_lastName).length == 0 || bytes(_birthDate).length == 0 || bytes(_hospitalName).length  == 0 || bytes(_lastAttended).length == 0 || bytes(_findings).length == 0 || bytes(_doctorName).length == 0){
            revert("All fields are required");
        }
        uint historyCounter = mapPatient[patientId].historyCounter;

        History memory newHistory;
        newHistory.hospitalName = _hospitalName;
        newHistory.lastAttended= _lastAttended;
        newHistory.doctorName = _doctorName;
        newHistory.findings =_findings;

        mapPatient[patientId].mapHistory[historyCounter] = newHistory; // Insert new History to Patient->History
        mapPatient[patientId].historyCounter++; // Increase the number of history

        return("History updated!" ,  mapPatient[patientId].historyCounter);

    }

    function getPatientHistoryV2(string _firstName, string _middleName, string _lastName, string  _birthDate, uint historyIndex) public view returns(string, string, string, string){
      bytes32 patientId = sha256(abi.encodePacked(_firstName, _lastName, _middleName, _birthDate));
      // Check if Patient Exist
      require(isExist(patientId), "Patient doesn\'t exist!");
      if(bytes(mapPatient[patientId].mapHistory[historyIndex].hospitalName).length == 0){
          revert('Invalid key!');
      }
      return (mapPatient[patientId].mapHistory[historyIndex].hospitalName, mapPatient[patientId].mapHistory[historyIndex].lastAttended, mapPatient[patientId].mapHistory[historyIndex].findings, mapPatient[patientId].mapHistory[historyIndex].doctorName);
    }

    function isExist(bytes32 hash) private view returns (bool) {
        return mapPatient[hash].isExist;
    }
}
