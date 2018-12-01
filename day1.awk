#!/usr/bin/awk -f

BEGIN {
  frequency=0
  freqs[0]=1
}
{
  frequency+=$1
}
END {
  print frequency
}
