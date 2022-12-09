type theme =
| Dark
| Light;

let appBackground = theme => switch(theme) {
  | Dark => "#4f391c"
	| Light => "#ffe0e0"
}

let appColor = theme => switch(theme) {
  | Dark => "#ffc"
	| Light => "#001"
}