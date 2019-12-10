pragma solidity ^0.5.0;

contract studentEnrolment{
    
    address  payable private myAddress;
    
    enum gender{male, female}
    
    struct student{
        string name;
        uint age;
        address addr;
        bool digree;
        gender gen;
    }
    
    mapping(address => student)studentData;
    
    function _setAddress(address payable _myAddress)public{
        myAddress = _myAddress;
    }
    
    function _enrollStudent(string memory _name, uint _age, address _address, bool _haveDegree, gender _gender)public payable{
        
        student memory myStudent = student(_name, _age, _address, _haveDegree, _gender);
        
        myAddress.transfer(msg.value);
        
        studentData[_address] = myStudent;
    }
    
    function _balance()public view returns(uint){
        return myAddress.balance;
    }
    
    function _has_Degree(address _address)public view returns(bool digree){
        return studentData[_address].digree;
    }
    
}