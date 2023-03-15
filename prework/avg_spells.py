def avg_spells():
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
    tie = 0
    for j in range(len(gandalf_spells)):
        #print(gandalf_spells[j])
        #gandalf_avg = sum(gandalf_spells)/len(gandalf_spells)
        #saruman_avg = sum(saruman_spells)/len(saruman_spells)
        #print(saruman_spells[j])
        if gandalf_spells[j] > saruman_spells[j]:
            gandalf_win += 1
            saruman_win = 0
        elif gandalf_spells[j] < saruman_spells[j]:
            gandalf_win = 0
            saruman_win += 1

    avg_spells = 0
    if gandalf_win >= 3:
        avg_spells = sum(gandalf_spells)/len(gandalf_spells)
        print("Gandalf wins")
        print(avg_spells)
        return avg_spells
    elif saruman_win >= 3:
        avg_spells = sum(saruman_spells)/len(saruman_spells)
        print("Suruman wins")
        print(avg_spells)
        return avg_spells 
    else: 
        print("Tie")
        print(avg_spells)
        return avg_spells 
        
avg_spells()
