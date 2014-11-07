// FIBONACCI SERIES
// CHALLENGE DESCRIPTION:
//
//
// The Fibonacci series is defined as: F(0) = 0; F(1) = 1; F(n) = F(n-1) + F(n-2) when n>1. Given a positive integer 'n', print out the F(n).
//
// INPUT SAMPLE:
//
// The first argument will be a path to a filename containing a positive integer, one per line. E.g.
//
// 5
// 12
// OUTPUT SAMPLE:
//
// Print to stdout, the fibonacci number, F(n). E.g.
//
// 5
// 144

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
		var n = parseInt(line);
		console.log(fibonacci(n));
  }
});

function fibonacci(n) {
	if (n == 0) {
		return (0);
	} else if (n == 1) {
		return 1; 
	} else {
		return fibonacci(n -1) + fibonacci(n-2);
	}
}