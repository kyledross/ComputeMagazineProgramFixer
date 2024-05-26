# Compute! Magazine BASICA Program Fixer

## Purpose
In the 1980s, a magazine called Compute! was published.  Often, BASICA (GW-BASIC) programs were included in the magazine for entry by the purchaser.  These programs were formatted for magazine publication, and also often included a two-character checksum that, when used with their entry program, aided in typing the program into the computer.  

Archived issues of Compute! exist on the Internet today, and to help in running these programs, I created this Python script to input, format, and output the program in a usable state.  

This program will also check the checksum on each line, and alert you when it does not match.  You can then scrutinize the code in the magazine vs what is being processed.  (Often times, optical character recognition was used to get these programs from the magazines, which can cause characters to be misread, resulting in checksum errors).

## Usage
Change the filenames within the script, and then run the script using Python3 main.py.  Make changes as needed.