let appBackground: Types.theme => string = theme => switch(theme) {
  | Dark => "#4f391c"
	| Light => "#ffe0e0"
}