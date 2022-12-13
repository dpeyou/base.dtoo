@react.component
let make = (
  ~isMenuOpen: bool=false,
  ~navToPage: Header.page => unit,
  ~page: Header.page,
  ~theme: Theme.theme,
  ~toggleMenu: unit => unit=() => (),
  ~toggleTheme: unit => unit=() => (),
) => {
  // inline styles for navbar
  let style = ReactDOM.Style.make(
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
  let arrowRightIcon =
    <svg
      className="feather feather-arrow-right"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="2"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <line x1="5" y1="12" x2="19" y2="12" />
      <polyline points="12 5 19 12 12 19" />
    </svg>

  let menuIcon =
    <svg
      className="feather feather-menu"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="1.5"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <line x1="3" y1="12" x2="21" y2="12" />
      <line x1="3" y1="6" x2="21" y2="6" />
      <line x1="3" y1="18" x2="21" y2="18" />
    </svg>

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

  let xIcon =
    <svg
      className="feather feather-x"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <line x1="18" y1="6" x2="6" y2="18" />
      <line x1="6" y1="6" x2="18" y2="18" />
    </svg>

  // -- VIEW
  <>
    <div id="Navbar" className="navigation" style>
      <Button
        height="2.5rem"
        left="0"
        margin="0"
        onClick=toggleTheme
        position="absolute"
        theme
        width="4rem">
        {switch theme {
        | Dark => moonIcon
        | Light => sunIcon
        }}
      </Button>
      <Button
        height="2.5rem"
        margin="0 0.25rem"
        onClick=toggleMenu
        padding="0 0.25rem"
        theme
        width="4rem">
        {isMenuOpen ? xIcon : menuIcon}
      </Button>
      <Button
        height="2.5rem"
        margin="0"
        onClick={page == Home ? () => navToPage(Header.Projects) : () => navToPage(Header.Home)}
        position="absolute"
        right="0"
        theme
        width="4rem">
        arrowRightIcon
      </Button>
    </div>
    <Scrollview
      background={Theme.menuBackground(theme)}
      bottom="3.25rem"
      id="Menu"
      opacity={isMenuOpen ? "1" : "0"}
      pointerEvents={isMenuOpen ? "auto" : "none"}
			//scrollToTop={()=>()}
      tabIndex={isMenuOpen ? 0 : -1}
      theme
      top="2.75rem"
      transform={isMenuOpen ? "translateY(0px)" : "translateY(25px)"}>
      <section>
        <h2> {"Pages"->React.string} </h2>
        <Button onClick={() => navToPage(Header.Home)} theme> {"Home"->React.string} </Button>
        <Button onClick={() => navToPage(Header.Projects)} theme>
          {"Projects"->React.string}
        </Button>
      </section>
    </Scrollview>
  </>
}
