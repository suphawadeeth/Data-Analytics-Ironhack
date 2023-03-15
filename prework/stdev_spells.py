import statistics as stat
def stdev_spells():
    # YOUR SOLUTION HERE
    power = {
    'Fireball': 50,
    'Lightning bolt': 40,
    'Magic arrow': 10,
    'Black Tentacles': 25,
    'Contagion': 45
}

    gandalf = ['Fireball', 'Lightning bolt', 'Lightning bolt', 'Magic arrow', 'Fireball', 'Magic arrow', 'Lightning bolt', 'Fireball', 'Fireball', 'Fireball']
    saruman = ['Contagion', 'Contagion', 'Black Tentacles', 'Fireball', 'Black Tentacles', 'Lightning bolt', 'Magic arrow', 'Contagion', 'Magic arrow', 'Magic arrow']
    gandalf_spells = []
    saruman_spells = []
    for i in range(len(gandalf)):
        for k,v in power.items():
            if gandalf[i] in k:
                gandalf_spells.append(v)
                #print(v)
            if saruman[i] in k:
                saruman_spells.append(v)
                #print(v)
    gandalf_win = 0
    saruman_win = 0
    for j in range(len(gandalf_spells)):
        if gandalf_spells[j] > saruman_spells[j]:
            gandalf_win += 1
            saruman_win = 0
        elif gandalf_spells[j] < saruman_spells[j]:
            gandalf_win = 0
            saruman_win += 1
    std_winner = 0
    if gandalf_win >= 3:
        std_winner = round(stat.stdev(gandalf_spells), 1)
    elif saruman_win >= 3:
        std_winner = round(stat.stdev(saruman_spells), 1)
    else: pass
        #print("Tie")
    solution3 = std_winner
    #print(solution3)
    print(solution3)
    return solution3

stdev_spells()
