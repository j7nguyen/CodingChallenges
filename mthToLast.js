// CHALLENGE DESCRIPTION:
//
// Write a program which determines the Mth to the last element in a list.
//
// INPUT SAMPLE:
//
// The first argument is a path to a file. The file contains the series of space delimited characters followed by an integer. The integer represents an index in the list (1-based), one per line.
//
// For example:
//
//
// 2
// e f g h 2
// OUTPUT SAMPLE:
//
// Print to stdout the Mth element from the end of the list, one per line. If the index is larger than the number of elements in the list, ignore that input.
//
// For example:
//


var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
			chars = line.split(' ')
			var m = parseInt(chars.pop());
			if (m > chars.length) {
				return;
			} else {
				console.log(chars[chars.length - m]);
			}
    }
});