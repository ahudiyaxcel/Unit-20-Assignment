pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable _one;
    address payable _two;
    address payable _three;

    constructor(address payable employee_one, address payable employee_two, address payable employee_three) public {
        _one = employee_one;
        _two = employee_two;
        _three = employee_three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value/3 ;

        // @TODO: Transfer the amount to each employee
        
        _one.transfer(amount);
        _two.transfer(amount); 
        _three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value - (amount *3));
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}
