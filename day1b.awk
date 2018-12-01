#!/usr/local/bin/gawk -f

BEGIN {
  freqs[0]=0
}
NR == 1 {
  # Get the number of lines in the current file
  ( "cat " FILENAME " | wc -l" ) | getline NL   
}
{
  frequency+=$1
  if(frequency in freqs) {
    exit
  } else {
    freqs[frequency]=1
  }
}
FNR == NL {
  ARGC++
  ARGV[ARGIND+1] = FILENAME
  nextfile
}
END {
  print ARGC
  print frequency
}
