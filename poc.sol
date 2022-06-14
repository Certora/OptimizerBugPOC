contract Test {               
	function test() external {
		assembly {
			mstore(0, 0x123456789abcdef)
		}
		assembly {
			log0(0, 64)
		}
	}                
}
