open Types;

let appBackground = theme =>
  switch theme {
  | Dark => "rgb(111, 89, 60)"
  | Light => "#fff"
  }

let appColor = theme =>
  switch theme {
  | Dark => "#fff"
  | Light => "#000"
  }

let buttonBackground = theme =>
  switch theme {
  | Dark => "#ffe0a0"
  | Light => "#ffffb9"
  }

let headingColor = theme =>
  switch theme {
  | Dark => "#ffe0a0"
  | Light => "#000"
  }

let textBlockBackground = theme =>
  switch theme {
  | Dark => "#654"
  | Light => "#fff"
  }

let menuBackground = theme =>
  switch theme {
  | Dark => "rgb(111, 89, 60)"
  | Light => "#d9efff"
  }

let scrollviewBackground = theme =>
  switch theme {
  | Dark => "rgb(66, 50, 21)"
  | Light => "#f2e7e4"
  }
