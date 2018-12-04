#!/usr/local/bin/gawk -f
{
  sub(/00:/, "", $2)
  sub(/]/, "", $2)
  sub(/#/, "", $4)
  switch ($3) {
  case "Guard":
    currentGuard = $4
    break
  case "falls":
    asleeptime = $2
    break
  case "wakes":
    guardAsleepTime[currentGuard] += ($2 - asleeptime)
    for (i=asleeptime; i<$2; i++) guardAsleepMinutes[currentGuard][i]++
    break
  }
}
END {
  for (guard in guardAsleepTime) {
    if (guardAsleepTime[guard] > guardAsleepTime[longest]) longest = guard
  }
  for (min in guardAsleepMinutes[longest]) {
    if (guardAsleepMinutes[longest][min] > guardAsleepMinutes[longest][maxMinute]) maxMinute = min
  }
  print longest * maxMinute
}
