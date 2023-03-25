package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func check(e error) {
	if e != nil {
    	}
}

func findPossible(in string) {

	// read file
    	file, err := os.Open("dict.txt")
	check(err)
    	defer file.Close()
    	scanner := bufio.NewScanner(file)

	// create array of words from file
	var dict [58110]string
	counter := 0
    	for scanner.Scan() {
		dict[counter] = scanner.Text()
		counter++
    	}

	// make a key : value of the input letters : times_used
	var ltrList  = make(map[string]int)
	for _, elementRaw := range in {
		element := string(elementRaw)
		ltrList[element]++
	}

	/*
	My method: this method makes use of a dictionary made from a GoLang 'map'. In this case, the 'key'
	is a letter in the user's input and the 'value' is how many times it appears in the input. I then
	test every word in the file and apply the following filters:

	- If the word contains a letter that the input did not have, reject.
	- If the word is not at least 3 letters long, reject
	- If the word contains a letter more often than the input, reject.
	*/
	var fail int
	for _, word := range dict {
		fail = 0
		for  _, letter := range word {
			val, exists := ltrList[string(letter)]
			if (exists) {
				if strings.Count(word, string(letter)) > val {fail = 1}
				if len(word) < 3 {fail = 1}
			} else {fail = 1}
		}
		if fail == 0 {fmt.Printf("%s\n", word)}
	}
}

func main() {

	// grab user input
	var input string
	fmt.Printf("%s", "Type character pool: ")
	fmt.Scan(&input)
	fmt.Printf("%s\n", "-----------------------------")

	findPossible(input)

}
