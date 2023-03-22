# read words (input) from users >> save it to a list, until the user enter blank line >> print the words that's unique
""""
This small program reads word from user, store them in a list.
When user enter blank, it deduplicates words and print all the unique words in a list
"""
input_list = list()
output = list()
active = True
while active:
    word = input("Please, enter a word, or enter a blank line to quit: ")
    input_list.append(word)
    if word == "":
        active = False

for i in input_list:
    if i != "":
        if i not in output:
            output.append(i)
    else: pass

# this print statement prints output (a list) into a sepearate line
print(*output, sep = "\n") # * is for separating comma (,)

# print(output) # this method presents output as a list

# this for loop is another option for printing word into a separate line
"""
for j in range(len(output)):
    print(output[j])
"""




# Another option is use: set(), instead of list() 
# set() function deduplicates input automatically but when print the output, words are not in the same order as user's input
