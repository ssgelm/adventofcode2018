#!/usr/bin/python

import sys

def similarchars(one, two):
    similar = ""
    for n, c in enumerate(one):
        if c == two[n]:
            similar += c
    return similar

with open("day2input.txt") as f:
    lines = f.readlines()
    lines = [s.strip() for s in lines]

for line in lines:
    for secondline in lines:
        similar = similarchars(line, secondline)
        if len(similar) == len(line) - 1:
            print similar
            sys.exit(0)

