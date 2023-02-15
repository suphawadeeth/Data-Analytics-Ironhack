def escape():
    # Assign problem data to variables with representative names
    # well height, daily advance, night retreat, accumulated distance
    daily_climb = [30, 21, 33, 77, 44, 45, 23, 45, 12, 34, 55]
    well_height = 125
    nightly_fall = 20
    total_distance = 0

    # Assign 0 to the variable that represents the solution
    total_days = 0
    # YOUR SOLUTION HERE
    daylight = True


    while total_distance < well_height:
        for i in range(len(daily_climb)):
            if daylight:
                total_distance += daily_climb[i]
                daylight = False
                #print(total_distance)
            else:
                total_distance -= nightly_fall
                total_days += 1
                daylight = True
                #print(total_days)
                #print(total_distance)
        return total_days


escape()
