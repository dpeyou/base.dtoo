@react.component
let make = (~isMenuOpen: bool, ~page:Types.page, ~theme: Types.theme) => {
  // inline styles
  let containerStyle = ReactDOM.Style.make(
    ~background="inherit",
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

  // inline styles
  let headingStyle = ReactDOM.Style.make(
    ~bottom="0",
    //~height="2.5rem",
    ~lineHeight="1.25",
    ~margin="0",
    (),
  )

  // -- VIEW
  <div id="Header" style=containerStyle>
    <h1 style=headingStyle>
      {{
        isMenuOpen
          ? "Menu"
          : {
              switch page {
              | Home => "Home"
              | Projects => "Projects"
              }
            }
      }->React.string}
    </h1>
  </div>
}
