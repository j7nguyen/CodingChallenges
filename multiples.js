// Given numbers x and n, where n is a power of 2, print out the smallest multiple of n which is greater than or equal to x. Do not use division or modulo operator.
//
// INPUT SAMPLE:
//
// The first argument will be a path to a filename containing a comma separated list of two integers, one list per line. E.g.
//
// 13,8
// 17,16
// OUTPUT SAMPLE:
//
// Print to stdout, the smallest multiple of n which is greater than or equal to x, one per line. E.g.
//
// 16
// 32

var fs  = require("fs");

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
	    if (line != "") {
        var nums = line.split(',')
				nums.forEach(function (num, ind, arr) {
					arr[ind] = parseInt(num);
				});
				a = nums[0];
				b = nums[1];
				var least_mult = b
				for (var i = 1; least_mult < a; i++ ) {
					least_mult = b*(i+1);
				}
				console.log(least_mult);
    }
});

