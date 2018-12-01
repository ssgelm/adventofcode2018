#!/usr/bin/awk -f

{
  frequency+=$1
}
END {
  print frequency
}
