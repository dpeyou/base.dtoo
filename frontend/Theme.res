type theme =
| Dark
| Light;

let appBackground = theme => switch(theme) {
  | Dark => "#4f391c"
	| Light => "#ffe0e0"
}

let appColor = theme => switch(theme) {
  | Dark => "#fed"
	| Light => "#001"
}

let buttonBackground = theme => switch(theme) {
  | Dark => "#ffe0a0"
	| Light => "#ffffe9"
}

let scrollviewBackground = theme => switch(theme) {
  | Dark => "#eed0d0"
	| Light => "#eff"
}