@react.component
let make = (
  ~isMenuOpen: bool=false,
  ~theme: Theme.theme=Dark,
  ~toggleMenu: unit => unit=() => (),
) => {
  // inline styles for navbar
  let style = ReactDOM.Style.make(
    ~alignItems="center",
    ~background="inherit",
    //~background=Theme.appBackground(theme),
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

  let menuIcon =
    <svg
      className="feather feather-menu"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <line x1="3" y1="12" x2="21" y2="12" />
      <line x1="3" y1="6" x2="21" y2="6" />
      <line x1="3" y1="18" x2="21" y2="18" />
    </svg>

  // -- VIEW
  <>
    <div id="Navbar" className="navigation" style>
      <Button height="2.5rem" margin="0 0.25rem" onClick=toggleMenu padding="0 0.25rem" theme>
        menuIcon
      </Button>
    </div>
    <Scrollview
      bottom="3.25rem"
      id="Menu"
      opacity={isMenuOpen ? "1" : "0"}
      pointerEvents={isMenuOpen ? "auto" : "none"}
      tabIndex={isMenuOpen ? 0 : -1}
      top="2.5rem"
      transform={isMenuOpen ? "translateY(0px)" : "translateY(25px)"}>
      <h1> {"Pages"->React.string} </h1>
    </Scrollview>
  </>
}
