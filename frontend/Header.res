type page =
  | Home
  | Projects

@react.component
let make = (~page, ~theme: Theme.theme) => {
  let style = ReactDOM.Style.make(
    //~background=Theme.appBackground(theme),
    ~bottom="0",
    ~color=Theme.appColor(theme),
    ~display="flex",
    ~height="2.5rem",
    ~justifyContent="center",
    ~left="0",
    ~margin="0 0.35rem",
    ~position="absolute",
    ~right="0",
    ~top="0",
    (),
  )

  // -- VIEW
  <h1 style>
    {switch page {
    | Home => "Home"
    | Projects => "Projects"
    }->React.string}
  </h1>
}
