@react.component
let make = (
  ~navToPage: Types.page => unit,
  ~theme: Types.theme,
  ~toggleTheme: Types.theme => unit=_someTheme => (),
) => {
  //let pageButtons;

  // inline styles
  let headingStyles = ReactDOM.Style.make(
    ~color=Theme.headingColor(theme),
    ~fontSize="1.8rem",
    ~margin="1rem 0.25rem 0.5rem",
    (),
  )
  let sectionStyle = ReactDOM.Style.make(
    ~alignItems="center",
    ~background="inherit",
    ~bottom="0",
    ~color=Theme.appColor(theme),
    ~display="flex",
    ~height="2.5rem",
    ~justifyContent="center",
    ~left="0",
    ~margin="0 0.35rem",
    ~padding="0.25rem 0",
    ~position="absolute",
    ~right="0",
    (),
  )

  // -- SVG
  let moonIcon =
    <svg
      className="feather feather-moon"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="2"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" />
    </svg>

  let sunIcon =
    <svg
      className="feather feather-sun"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="2"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <circle cx="12" cy="12" r="5" />
      <line x1="12" y1="1" x2="12" y2="3" />
      <line x1="12" y1="21" x2="12" y2="23" />
      <line x1="4.22" y1="4.22" x2="5.64" y2="5.64" />
      <line x1="18.36" y1="18.36" x2="19.78" y2="19.78" />
      <line x1="1" y1="12" x2="3" y2="12" />
      <line x1="21" y1="12" x2="23" y2="12" />
      <line x1="4.22" y1="19.78" x2="5.64" y2="18.36" />
      <line x1="18.36" y1="5.64" x2="19.78" y2="4.22" />
    </svg>

  // -- VIEW
  <Scrollview
    background={theme == Dark ? Theme.scrollviewBackground(theme) : Theme.menuBackground(theme)}
    bottom="0"
    id="Sidebar"
    left="60%"
    //scrollToTop={()=>()}
    theme
    top="2.5rem">
    <section>
      <h2 style=headingStyles> {"Pages"->React.string} </h2>
      <Button fontSize="1.5rem" margin="0 0 0.25rem" onClick={() => navToPage(Types.Home)} theme width="100%">
        {"Home"->React.string}
      </Button>
      <Button
        fontSize="1.5rem" margin="0 0 0.25rem" onClick={() => navToPage(Types.Projects)} theme width="100%">
        {"Projects"->React.string}
      </Button>
    </section>
    <section>
      <h2 style=headingStyles> {"Theme"->React.string} </h2>
      <Button
        height="2.5rem" left="0" margin="0 0 0.25rem" onClick={() => toggleTheme(Types.Dark)} theme width="100%">
        moonIcon
      </Button>
      <Button height="2.5rem" left="0" margin="0 0 0.25rem"  onClick={() => toggleTheme(Types.Light)} theme width="100%">
        sunIcon
      </Button>
    </section>
  </Scrollview>
}
