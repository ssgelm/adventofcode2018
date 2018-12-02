#!/usr/local/bin/gawk -f

{
  split($1,letters,"")
  for (c in letters) {
    counts[letters[c]] += 1
  }
  hasdouble = 0
  hastriple = 0
  for (c in counts) {
    switch (counts[c]) {
    case 2:
      hasdouble++
      break
    case 3:
      hastriple++
      break
    }
  }
  if (hasdouble > 0) twoletter++
  if (hastriple > 0) threeletter++
  delete counts
}
END {
  print twoletter * threeletter
}
