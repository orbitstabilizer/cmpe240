* positional number system
	* base : radix 
		* Binary : 2 ->  positional representation : $B = \Sigma_{i=-n}^{p-1} b_i 2^i$  
		* Octal : 8
		* Hexa : 16
* octal and hexal number are useful for ..?
	* conversion from and to hexa/octal and binary
		* binary -> octal/hexal
			* pad by 0's as necesary
			* group by 3/4 digits
			* convert 
	* binary to decimal : easy
	* decimal to bianry : less easy
* Decimal to radix **r** , integer part
	* succecively divide by **r** and accumulate remainders from left to right 
	* LSB , MSB
* ..., fractional part
	* succecively multiply by **r** (drop integer part at each step) and accumulate integer parts from right to left
	   