// NUMBER OF ONES
// CHALLENGE DESCRIPTION:
//
//
// Write a program which determines the number of 1 bits in the internal representation of a given integer.
//
// INPUT SAMPLE:
//
// The first argument is a path to a file. The file contains integers, one per line.
//
// For example:
//
//
// 10
// 22
// 56
// OUTPUT SAMPLE:
//
// Print to stdout the number of ones in the binary form of each number.
//
// For example:
//
//
// 2
// 3
// 3

function binary(n) {
	var binaryDigits = [];
  var remainder = n;
	multiplier = 1;
	while (remainder > 0) {
		var digit = 0;
		if (remainder/multiplier % 2 == 1) {
			binaryDigits.unshift(1);
			remainder -= multiplier;
		} else {
			binaryDigits.unshift(0);
		}
		multiplier *= 2;
	}
	return binaryDigits;
}

function onesCounter(digits) {
	var count = 0;
	digits.forEach(function(digit){
		if (digit == 1) {
			count += 1;
		}
	});
	console.log(count);
}

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
			var digits = binary(parseInt(line));
			onesCounter(digits);
    }
});