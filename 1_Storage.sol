// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/**
 * @title StudentRegistry
 * @dev A simple contract where students can register their name and ID, 
 *      and retrieve their details later.
 */
contract StudentRegistry {

    // Struct to hold student data
    struct Student {
        string name;
        uint256 studentId;
    }

    // Mapping from Ethereum address to Student info
    mapping(address => Student) private students;

    // Event for when a student registers
    event StudentRegistered(address studentAddress, string name, uint256 studentId);

    /**
     * @dev Register a student with name and ID
     * @param _name Name of the student
     * @param _studentId Student ID number
     */
    function registerStudent(string memory _name, uint256 _studentId) public {
        students[msg.sender] = Student(_name, _studentId);
        emit StudentRegistered(msg.sender, _name, _studentId);
    }

    /**
     * @dev Retrieve your student details
     * @return name and studentId of the caller
     */
    function getMyDetails() public view returns (string memory, uint256) {
        Student memory s = students[msg.sender];
        return (s.name, s.studentId);
    }
}

