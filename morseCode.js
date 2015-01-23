var morseCode = function(str) {
	var morseAlpha = {
                ".-": "A",
                "-...": "B",
                "-.-.": "C",
                "-..": "D",
                ".": "E",
                "..-.": "F",
                "--.": "G",
                "....": "H",
                "..": "I",
                ".---": "J",
                "-.-": "K",
                ".-..": "L",
                "--": "M",
                "-.": "N",
                "---": "O",
                ".--.": "P",
                "--.-": "Q",
                ".-.": "R",
                "...": "S",
                "-": "T",
                "..-": "U",
                "...-": "V",
                ".--": "W",
                "-..-": "X",
                "-.--": "Y",
                "--..": "Z",
                "-----": "0",
                ".----": "1",
                "..---": "2",
                "...--": "3",
                "....-": "4",
                ".....": "5",
                "-....": "6",
                "--...": "7",
                "---..": "8",
                "----.": "9"
            };
						var wordsIn = str.split("  ");
						wordsOut = []
						wordsIn.forEach(function(word) {
							var chars = word.split(" ");
							var wordString = "";
							chars.forEach(function(char) {
								wordString = wordString.concat(morseAlpha[char]);
							});
							wordsOut.push(wordString);
						});
						return wordsOut.join(" ");
}