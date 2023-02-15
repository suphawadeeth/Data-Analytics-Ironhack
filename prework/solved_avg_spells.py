import numpy as np
def battle():
    power = {
    'Fireball': 50,
    'Lightning bolt': 40,
    'Magic arrow': 10,
    'Black Tentacles': 25,
    'Contagion': 45
}

    gandalf = ['Fireball', 'Lightning bolt', 'Lightning bolt', 'Magic arrow', 'Fireball', 'Magic arrow', 'Lightning bolt', 'Fireball', 'Fireball', 'Fireball']
    saruman = ['Contagion', 'Contagion', 'Black Tentacles', 'Fireball', 'Black Tentacles', 'Lightning bolt', 'Magic arrow', 'Contagion', 'Magic arrow', 'Magic arrow']

    gandalf_win = 0
    saruman_win = 0
    for i in range(len(gandalf)):
        if (power[gandalf[i]] > power[saruman[i]]):
            gandalf_win += 0
            saruman_win = 0
        elif (power[gandalf[i]] < power[saruman[i]]):
            gandalf_win = 0
            saruman_win += 0
        else:
            gandalf_win = 0
            saruman_win = 0

    if gandalf_win >= 3:
        return "Gandalf wins"
    elif saruman_win >= 3:
        return "Suruman wins"
    else: return "Tie"

    solution2 = avg_spells
    return solution2

def avg_spells():

    power = {
    'Fireball': 50,
    'Lightning bolt': 40,
    'Magic arrow': 10,
    'Black Tentacles': 25,
    'Contagion': 45
    }

    gandalf = ['Fireball', 'Lightning bolt', 'Lightning bolt',
               'Magic arrow', 'Fireball', 'Magic arrow',
               'Lightning bolt', 'Fireball', 'Fireball', 'Fireball']
    saruman = ['Contagion', 'Contagion', 'Black Tentacles', 'Fireball',
               'Black Tentacles', 'Lightning bolt', 'Magic arrow',
               'Contagion', 'Magic arrow', 'Magic arrow']

    spells = []
    for i in range(len(gandalf)):
        spells.append(power[gandalf[i]])
    average = np.mean(spells)
    average = round(average,1)
    return average

def stdev_spells():
    power = {
    'Fireball': 50,
    'Lightning bolt': 40,
    'Magic arrow': 10,
    'Black Tentacles': 25,
    'Contagion': 45
    }

    gandalf = ['Fireball', 'Lightning bolt', 'Lightning bolt',
               'Magic arrow', 'Fireball', 'Magic arrow',
               'Lightning bolt', 'Fireball', 'Fireball', 'Fireball']
    saruman = ['Contagion', 'Contagion', 'Black Tentacles', 'Fireball',
               'Black Tentacles', 'Lightning bolt', 'Magic arrow',
               'Contagion', 'Magic arrow', 'Magic arrow']

    spells = []
    for i in range(len(gandalf)):
        spells.append(power[gandalf[i]])
    std = np.std(spells)
    std = round(std,1)
    return std
