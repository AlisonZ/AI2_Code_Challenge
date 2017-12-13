# TODO
# eventually generate this array based on user input
searchTermsArray = ["queequeg", "whale", "sea", "whenever"];

# global variables
wordArray = [];

#initializes with default value of 0 so can increment later
wordHash = Hash.new(0);
documentCounter = 2;
resultsHash = Hash.new(0);

# HMMMM... HOW TO CHECK THE SEARCH TERMS AGAINST THE WORDHASH AND
# SAVE IN A NEW HASH WHICH HAS INFO ABOUT THE DIFFERENT DOCS

#how to design so that each search term is its own hash? with info about its documents and values?
def checkSearchTerms(wordHash, searchTermsArray, documentCounter, resultsHash, wordArray)
    documentCounter;
    documentNumber = "Document " + documentCounter.to_s
    searchTermsArray.each do |word|
        resultsHash.merge!(word => { documentNumber => wordHash[word]})
        # need to figure out the frequency based on the wordHash[word] and the wordArray.length
    end
    # puts wordArray.length
    # puts resultsHash
end

#loops through the array of words from the text and adds them to a Hash
# hash contains the word as the key
# value is the number of times word appears in text
# def createWordHash(createWordArray, wordArray, wordHash)
    # createWordArray;
def createWordHash(wordArray, wordHash)
    wordArray.each do |word|
       if !wordHash[word]
           wordHash[word] = 1
       else
           wordHash[word] +=1
       end
    end

    return wordHash;
end

# TODO
# this needs to eventually take in a set of documents
def createWordArray(text, wordArray)
    text = File.read(text)
    newText = text.gsub(/\W/, ' ')

    splitText = newText.split(' ').map(&:downcase);
    splitText.each do |word|
        wordArray << word
    end
    # puts wordArray
    return wordArray
end

# 1. first need to run this to get the text in the word array
createWordArray('./texts/test.txt', wordArray);
# puts wordArray[16]

# 2. then can run createWordHash using the wordArray
createWordHash(wordArray, wordHash);
# puts wordHash["whenever"]

# 3. then can check search terms
checkSearchTerms(wordHash, searchTermsArray, documentCounter, resultsHash, wordArray);
