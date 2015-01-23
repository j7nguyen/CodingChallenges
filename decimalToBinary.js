var decimalToBinary = function(num) {
	var decimal = parseInt(num);
	var binaryDigits = [];
	var currentDivisor = 1;
	var finished = false;
	while (finished == false) {
		var currentDigit = Math.floor(decimal / currentDivisor) % 2;
		binaryDigits.unshift(currentDigit);
		currentDivisor *= 2;
		if (currentDivisor > decimal) {
			finished = true;
		}
	}
	return binaryDigits.join("");
}