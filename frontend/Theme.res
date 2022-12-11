type theme =
| Dark
| Light;

let appBackground = theme => switch(theme) {
  | Dark => "rgb(111, 89, 60)"
	| Light => "#fff"
}

let appColor = theme => switch(theme) {
  | Dark => "#fff"
	| Light => "#000"
}

let buttonBackground = theme => switch(theme) {
  | Dark => "#ffe0a0"
	| Light => "#ffffb9"
}

let menuBackground = theme => switch(theme) {
  | Dark => "rgb(111, 89, 60)"
	| Light => "#d9efff"
}

let scrollviewBackground = theme => switch(theme) {
  | Dark => "rgb(66, 50, 21)"
	| Light => "#f2e7e4"
}
