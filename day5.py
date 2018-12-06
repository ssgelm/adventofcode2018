#!/usr/bin/python

with open("day5input.txt") as f:
  inputStr = f.readline().strip()

def is_reactive_pair(pair):
    return pair[0] == pair[1].swapcase()

def has_reactive_pairs(inStr):
    for n, letter in enumerate(inStr):
        if n+2 > len(inStr):
            break
        if is_reactive_pair(inStr[n:n+2]):
            return True
    return False

def remove_all_reactive_pairs(inStr):
    for n, letter in enumerate(inStr):
        if n+2 > len(inStr):
            return inStr
        if is_reactive_pair(inStr[n:n+2]):
            inStr = inStr[:n] + inStr[n+2:]

while has_reactive_pairs(inputStr):
    inputStr = remove_all_reactive_pairs(inputStr)

print len(inputStr)
