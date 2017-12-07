# Process raw data scraped for yale dining
# to input file for database

#input_file = 'Berkeley_Fri_Breakfast.txt'
#output_file = 'BFB.txt'
#input_file = 'Berkeley_Fri_Lunch.txt'
#output_file = 'BFL.txt'
input_file = 'Berkeley_Fri_Dinner.txt'
output_file = 'BFD.txt'

if __name__ == '__main__':
    
    out_f = open(output_file, "w")
    in_f = open(input_file, "r")
    line = in_f.readline()
    while line != '':   # end of file
        #print line
        # read name
        name = line.strip()
        #print name
        if name == 'COMPLETE':
        	break

        # ignore the dietary restrictions
        line = in_f.readline()      # empty line
        line = in_f.readline()
        while line != '' and line != '\n':        # len(line) > 0
        	line = in_f.readline()

        # read nutrition
        line = in_f.readline()       #serving size
        #print line
        line = in_f.readline()
        while line != '' and line != '\n':  
            nutrition = 'unknown'
            amount = 'unknown'
            unit = 'cal'
            nutrition_line = line.split(':')
            if len(nutrition_line) != 2:
                print nutrition_line
                exit()
            nutrition = nutrition_line[0]
            other = nutrition_line[1].split()
            item = len(other)
            if item == 1:
                amount = other[0]
            elif item == 2:
                amount = other[0]
                unit = other[1]
            else:
                print other
                exit()
            # write
            s = name + ':' + nutrition + ':' + amount + ':' + unit + '\r\n'
            out_f.write(s)
            line = in_f.readline()

        line = in_f.readline()
    in_f.close()
    out_f.close()

