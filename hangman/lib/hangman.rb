# http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt

#so here above is link to data, i think i want this file to read it and download it as a file, even though its a one time thing, the other alternative is to just copy and paste and then be on with it

#so how do i use a url

words = []

words = File.open("http://scrapmaker.com/data/wordlists/twelve-dicts/5desk.txt")

p words