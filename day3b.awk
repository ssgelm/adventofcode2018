#!/usr/local/bin/gawk -f
function fillarea(x, y, w, h) {
  for (i = x; i < x+w; i++) {
    for (j = y; j < y+h; j++) {
      fabric[i][j]++
    }
  }
}
function checkarea(x, y, w, h) {
  for (i = x; i < x+w; i++) {
    for (j = y; j < y+h; j++) {
      if (fabric[i][j] > 1) return 0
    }
  }
  return 1
}
{
  sub(/:/, "", $3)
  split($3, loc, ",")
  x = loc[1]
  y = loc[2]
  split($4, size, "x")
  w = size[1]
  h = size[2]
  fillarea(x, y, w, h)
  sub(/#/, "", $1)
  claims[$1] = x " " y " " w " " h
}
END {
  for (claim in claims) {
    split(claims[claim], aclaim)
    x = aclaim[1]
    y = aclaim[2]
    w = aclaim[3]
    h = aclaim[4]
    if (checkarea(x, y, w, h)) {
      print claim
      exit
    }
  }
}
