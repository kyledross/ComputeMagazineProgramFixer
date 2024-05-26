# This program will read in an IBM PC program from Compute! magazine, check the checksums, and write the program out
# as a properly-formatted BASICA program.


def fix_program():
    # open file
    file = open("ChainReaction.txt", "r")
    # read file
    lines = file.readlines()
    # close file
    file.close()
    # open file
    file = open("ChainReactionFixed.bas", "w")
    # write file
    new_line = ""
    current_indent = 0
    current_checksum = ""
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
                new_line = new_line.strip()
                checksum = compute_checksum(new_line)
                if checksum != current_checksum:
                    print("Checksum error on line: " + new_line)
                    print("Expected checksum: " + current_checksum)
                    print("Actual checksum: " + checksum)
                file.write(new_line + "\n")

            # reset newLine
            new_line = ""
            # remove the two letters and add to newline and remove carriage return
            current_checksum = line[0:2]
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


def compute_checksum(line):
    checksum = 0
    for i in range(1, len(line) + 1):
        checksum = (checksum + ord(line[i - 1]) * i) & 255
    checksum = chr(65 + round(checksum / 16)) + chr(65 + (checksum & 15))
    return checksum


if __name__ == '__main__':
    fix_program()
