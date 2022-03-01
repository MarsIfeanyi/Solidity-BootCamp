/*    Exercises on Declearing Functions, Variables and functions visibility and inheritance in solidity: 

1. Create 3 contracts C, D, and E 
2. Do the following in contract C:
    a. Create an integer state variable called data which  can only be used internally and not at all in any other contracts. 
    b. Create an integer state variable called info which can be called both inside and outside the contract 
    c. immediately initialize info's value to 10 within a constructor
    d. Createa a function called increment which can only be used internally and not at all in any other contracts.
    It should take an input integer called a and be read only returning the calculation of its input + 1
    e. Write a function calle dupdateData which takes an integer argument called a and sets data to the argument. 
    The function should be able to be called both inside and outside the contract.
    f. Write a read only function called getData which returns value of the data and can be called both inside and outside the contract 
    g. Write a read only function called compute which calculates and returns two integer arguments a + b.
    The function should can only be used internally or by derived contracts.
    
    Do the following in contract D:
    a. derive contract C to a new variable c and set a new instance of the contract to it. 
    b. write a read only function called readInfo which returns the info from contract c
    which can be called both inside and outside the contract .
    
    Do the following in contract E:
    a. inherit contract C into E with the special keyword is 
    b. create an integer called result which can only be used internally and not even by derived contracts.
    c. create a private variable c which inherits the contract C 
    d. immediately set the variable c to a new instance of the contract C upon deployment with a constructor
    e. write a function called getComputedResult which sets the values of 23 and 5 to the compute function in contract C to the var result
    The function can be used both externally and internally. 
    f. create a public read only function called getResult which returns the var result. 
    g. create a read only function which returns the info variable from contract C and set the function 
    to be used both externally and internally. 
    
    h. Celebrate completing this dang long exercise because you deserve it!!!!

*/

//           MY SOLUTION

pragma solidity >=0.7.0 <0.9.0;

contract C {
    //private state variable
    uint256 private data;
    // Public state variable
    uint256 public info;

    //constructor can be either public or internal
    constructor() public {
        info = 10;
    }

    function increment(uint256 a) private pure returns (uint256) {
        return a + 1;
    }

    function updateData(uint256 a) public {
        data = a;
    }

    function getData() public view returns (uint256) {
        return data;
    }

    // Two Integer argument = inputs parameters
    function compute(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}

contract D {
    //Deriving contract C to a new variable c and setting a new instance of the contract to it, thus variable c has the data type of contract C
    C c = new C();

    function readInfo() public view returns (uint256) {
        return c.info(); //since variable has already inherited contract C.
    }
}

//contract E inheriting contract C. thus E now has all the features of C
contract E is C {
    uint256 private result;

    //private variable state c which inherits the contract C
    C private c;

    //setting the variable c to a new instance of the contract C upon deployment with a constructor
    constructor() public {
        c = new C();
    }

    function getComputedResult() public {
        //setting compute function in Contract C to the variable called result
        result = compute(23, 5);
    }

    function getResult() public view returns (uint256) {
        return result;
    }

    function getNewInfo() public view returns (uint256) {
        return c.info();
    }
}
