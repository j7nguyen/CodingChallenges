// Have the function LetterCountI(str) take the str parameter being passed and return the first word with the greatest number of repeated letters. For example: "Today, is the greatest day ever!" should return greatest because it has 2 e's (and 2 t's) and it comes before ever which also has 2 e's. If there are no words with repeating letters return -1. Words will be separated by spaces.


function LetterCountI(str) { 
  var words = str.split(" ");
	var repeatWord = -1
	var mostRepeats = 1
  words.forEach(function(word) {
		var counts = {};
    for (var i = 0; i < word.length; i++) {
    	char = word.charAt(i);
			counts[char] = counts[char] + 1 || 1;
    }
		var keys = Object.keys(counts);
		keys.forEach(function(key) {
			if (counts[key] > mostRepeats) {
				repeatWord = word;
				mostRepeats = counts[key];
			}
		})
  })
	return repeatWord;
}

LetterCountI("hello apple pie");