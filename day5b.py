#!/usr/bin/python

import re

results = {}

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
    return re.sub("(Aa|Bb|Cc|Dd|Ee|Ff|Gg|Hh|Ii|Jj|Kk|Ll|Mm|Nn|Oo|Pp|Qq|Rr|Ss|Tt|Uu|Vv|Ww|Xx|Yy|Zz|aA|bB|cC|dD|eE|fF|gG|hH|iI|jJ|kK|lL|mM|nN|oO|pP|qQ|rR|sS|tT|uU|vV|wW|xX|yY|zZ)", '', inStr)

def remove_letter(inStr, letter):
    return re.sub("[{}{}]".format(letter, letter.swapcase()), '', inStr)

def char_range(c1, c2):
    """Generates the characters from `c1` to `c2`, inclusive."""
    for c in xrange(ord(c1), ord(c2)+1):
        yield chr(c)

for char in char_range('a','z'):
    reducedStr = remove_letter(inputStr, char)
    while has_reactive_pairs(reducedStr):
        reducedStr = remove_all_reactive_pairs(reducedStr)
    print char
    results[char] = len(reducedStr)

print results[min(results, key=results.get)]
