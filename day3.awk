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
}
END {
  for (i in fabric) {
    for (j in fabric[i]) {
      if (fabric[i][j] >= 2) {
        overlap++
      }
    }
  }
  print overlap
}
