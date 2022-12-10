@react.component
let make = (~theme: Theme.theme=Theme.Dark) => {
  // -- VIEW
  <Scrollview theme>
    {"Projects"->React.string}
  </Scrollview>
}
