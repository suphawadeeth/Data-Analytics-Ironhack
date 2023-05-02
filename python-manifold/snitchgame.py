"""
These 2 functions return the winner base on their actions and scores.

gameWinners1 is a long script and it can be written in a 
shorter version as in gameWinners2.

"""

def gameWinners1(gryf, slyt):
    if gryf[1] == 'yes': 
        gryf_score = gryf[0] 
    else: 
        gryf_score = 0

    if slyt[1] == 'yes':
        slyt_score = slyt[0] 
    else: 
        slyt_score = 0

    if gryf_score > slyt_score:
        result = "Gryffindor wins!"
    elif gryf_score < slyt_score:
        result = "Slytherin wins!"
    else:
        result = "It's a draw!"
    return result



def gameWinners2(gryf, slyt):
    g_score = gryf[0] if gryf[1] == 'yes' else 0
    s_score = slyt[0] if slyt[1] == 'yes' else 0

    if g_score > s_score: 
        return "Gryffindor wins!"
    elif g_score < s_score: 
        return "Slytherin wins!"
    else:
        return "It's a draw!"

gameWinners1([150, 'yes'], [200, 'no'])
gameWinners2([150, 'yes'], [150, 'yes'])