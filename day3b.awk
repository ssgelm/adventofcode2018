#!/usr/local/bin/gawk -f
function fillarea(x, y, w, h) {
  for (i = x; i < x+w; i++) {
    for (j = y; j < y+h; j++) {
      fabric[i][j]++
    }
  }
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
    broken = 0
    for (i = x; i < x+w; i++) {
      for (j = y; j < y+h; j++) {
        if (fabric[i][j] > 1) {
          broken = 1
          break
        }
      }
      if (broken > 0) break
    }
    if (broken > 0) continue
    print claim
    exit
  }
}
