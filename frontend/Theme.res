type theme =
| Dark
| Light;

let appBackground = theme => switch(theme) {
  | Dark => "#4f391c"
	| Light => "#fff"
}

let appColor = theme => switch(theme) {
  | Dark => "#fed"
	| Light => "#000"
}

let buttonBackground = theme => switch(theme) {
  | Dark => "#ffe0a0"
	| Light => "#ffffb9"
}

let scrollviewBackground = theme => switch(theme) {
  | Dark => "#6f593c"  //"#eed0d0" // pinkish
	| Light => "#f2e7e4"
}

let scrollviewColor = theme => switch(theme) {
  | Dark => "#fed"
	| Light => "#001"
}

let scrollviewBorder = theme => switch(theme) {
  | Dark => "2px solid #000"
	| Light => "2px solid #000"
}