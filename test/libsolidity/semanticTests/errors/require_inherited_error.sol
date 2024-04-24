contract Base
{
    error CustomError(uint256, string, uint256);
}

contract C is Base
{
    function f() external pure
    {
        require(false, CustomError(1, "two", 3));
    }
}

// ====
// compileViaYul: true
// ----
// f() -> FAILURE, hex"11a1077e", hex"0000000000000000000000000000000000000000000000000000000000000001", hex"0000000000000000000000000000000000000000000000000000000000000060", hex"0000000000000000000000000000000000000000000000000000000000000003", hex"0000000000000000000000000000000000000000000000000000000000000003", hex"74776f0000000000000000000000000000000000000000000000000000000000"