

def fix_program():
    # open file
    file = open("ChainReaction.bas", "r")
    # read file
    lines = file.readlines()
    # close file
    file.close()
    # open file
    file = open("ChainReactionFixed.bas", "w")
    # write file
    new_line = ""
    current_indent = 0
    for line in lines:
        # make line exactly 32 characters long by adding spaces to the end if needed
        line = line.rstrip()
        while len(line) < 32:
            line += " "

        # if line begins two letters
        if line[0].isalpha() and line[1].isalpha():
            current_indent = indents(line)
            # write newLine to the output file if it is not empty
            if new_line != "":
                file.write(new_line + "\n")
            # reset newLine
            new_line = ""
            # remove the two letters and add to newline and remove carriage return
            new_line += line[2:].lstrip().replace("\n", "")
        # if line begins with spaces
        elif line[0] == " ":
            # remove all spaces and add to newline
            new_line += line[current_indent:].replace("\n", "")

    # close file
    if new_line != "":
        file.write(new_line + "\n")
    file.close()


def indents(line):
    # the line will begin with two letters, a space, and a number between 1 and 100000.
    # find the first letter after the number and return the index of that letter
    for i in range(3, len(line)):
        if line[i].isalpha():
            return i


if __name__ == '__main__':
    fix_program()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
