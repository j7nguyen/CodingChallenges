// FIND A SQUARE
// CHALLENGE DESCRIPTION:
//
// You have coordinates of four points on a plane. Check whether they make a square.
//
// INPUT SAMPLE:
//
// Your program should accept as its first argument a path to a filename. Input example is the following
//
// (1,6), (6,7), (2,7), (9,1)
// (4,1), (3,4), (0,5), (1,2)
// (4,6), (5,5), (5,6), (4,5)
// All numbers in input are integers between 0 and 10
//
// OUTPUT SAMPLE:
//
// Print results in the following way.
//
// false
// false
// true

inputs = "(1,5), (3,9), (0,8), (4,6)\n" +
"(2,6), (3,9), (7,2), (1,5)\n" +
"(2,0), (0,0), (0,2), (2,2)\n" +
"(6,0), (6,2), (0,0), (4,6)\n" +
"(6,0), (2,3), (0,9), (2,5)\n" +
"(4,5), (7,2), (4,2), (7,5)\n" +
"(2,2), (2,2), (2,2), (2,2)\n" +
"(3,2), (3,2), (5,2), (3,4)\n" + 
"(7,1), (4,1), (4,4), (7,4)\n" + //correctly true
"(0,4), (0,2), (2,2), (2,4)\n" + //correctly true
"(2,6), (3,2), (6,7), (7,3)\n" + //correctly true
"(1,6), (1,2), (5,2), (5,6)\n" + //correctly true
"(4,1), (4,8), (9,5), (4,3)\n" + //correctly false
"(0,2), (1,2), (1,1), (1,0)\n" + //correctly false
"(9,3), (5,7), (2,6), (2,0)\n" + //correctly false
"(1,2), (1,5), (4,2), (4,5)\n" + //correctly true
"(6,8), (6,7), (5,7), (5,8)\n" + //correctly true
"(5,6), (5,2), (5,6), (5,3)\n" + //correctly false
"(4,2), (1,4), (6,6), (1,3)\n" + //correctly false
"(7,3), (5,0), (9,1), (6,9)" //correctly false

var checkDistances = function(pv) {
	var x1 = pv[0], y1= pv[1], x2 = pv[2], y2 = pv[3], x3 = pv[4], 
		y3= pv[5], x4 = pv[6], y4 = pv[7];
	var distancesSquared = [];
	distancesSquared.push((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
	distancesSquared.push((x3-x1)*(x3-x1) + (y3-y1)*(y3-y1));
	distancesSquared.push((x4-x1)*(x4-x1) + (y4-y1)*(y4-y1));
	distancesSquared.push((x3-x2)*(x3-x2) + (y3-y2)*(y3-y2));
	distancesSquared.push((x4-x2)*(x4-x2) + (y4-y2)*(y4-y2));
	distancesSquared.push((x4-x3)*(x4-x3) + (y4-y3)*(y4-y3));
	distancesSquared.sort(function(a,b){return a-b});
	if (distancesSquared[0] == 0) {
		return false;
	}
	if (distancesSquared[4] != distancesSquared[5]) {
		return false;
	}
	if (distancesSquared[0] != distancesSquared[1]) {
		return false;
	} else if (distancesSquared[1] != distancesSquared[2]) {
		return false;
	} else if (distancesSquared[2] != distancesSquared[3]) {
		return false;
	}
	return true;
}

var checkSquare = function(pointsLine) {
	var points = pointsLine.replace(/[\s\(\)]/g, "").split(",")
	var pointValues = []
	points.forEach(function(point) {
		pointValues.push(parseInt(point));
	});
	return checkDistances(pointValues);
}

inputs.split('\n').forEach(function (line) {
    if (line != "") {
        console.log(checkSquare(line));
    }
});