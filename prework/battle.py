def battle():
    # YOUR SOLUTION HERE
    gandalf = [10, 11, 13, 30, 22, 11, 10, 33, 22, 22]
    saruman = [23, 66, 12, 43, 12, 10, 44, 23, 12, 17]
    saruman_win = 0
    gandalf_win = 0
    tie = 0
    for i in range(len(gandalf)):
        if gandalf[i] > saruman[i]:
            gandalf_win += 1
            #print("Gandalf wins")
        elif gandalf[i] < saruman[i]:
            saruman_win += 1
            #print("Saruman wins")
        else: tie += 1
    if gandalf_win > saruman_win:
        solution1 = print("Gandalf wins")
    elif gandalf_win < saruman_win:
        solution1 = print("Saruman wins")
    elif tie > gandalf_win and saruman_win:
        solution1 = print("Tie")
    #print(tie)
        return solution1

battle()
