@react.component
let make = (~layout: Types.layout,~page: Types.page, ~theme: Types.theme) => {
  // variable attributes & styles
  let isCurrentPage: bool = page == Blog
  let opacity = {isCurrentPage ? "1" : "0"}
  let pointerEvents = {isCurrentPage ? "auto" : "none"}
  let tabIndex = {isCurrentPage ? -1 : 0}
  let transform = {isCurrentPage ? "" : "translateX(25px)"}

  // inline styles
  let anchorStyles = ReactDOM.Style.make(
    ~color=Theme.headingColor(theme),
    ~fontSize="110%",
    ~fontWeight="bold",
    (),
  )
  let introStyles = ReactDOM.Style.make(
    ~background=Theme.textBlockBackground(theme),
    ~border="solid black",
    ~borderWidth="2px 0",
    ~fontSize="1.05rem",
    ~margin="0 0.25rem 3rem",
    ~padding="0.5rem",
    //~textAlign="center",
    (),
  )
  let pageStyles = ReactDOM.Style.make(~opacity, ~pointerEvents, ~transition="125ms", ())

  // variable attributes due to layout
  let isPortrait: bool = layout === Portrait
  let svBottom = {isPortrait ? "3rem" : "0"}
  let svRight = {isPortrait ? "0" : "40%"}
  let sttbRight = {isPortrait ? "0.1rem" : "41%"}

  // -- VIEW
  <div id="Blog" style=pageStyles tabIndex>
    <Scrollview
      id="BlogScrollview"
      bottom=svBottom
      opacity
      pointerEvents
      right=svRight
      sttbRight
      tabIndex
      theme
      top="2.5em"
      transform>
      <h1> {"UNDER CONSTRUCTION!"->React.string} </h1>
      <p style=introStyles>
        {"This is where I'll be showing my projects, tutorials and anything else I feel like sharing. For now, here's a link to a video of me speaking 4 languages fluently & trying my best with two others:"->React.string}
        <a href="https://www.youtube.com/watch?v=pHdxYS1cr0o&t=128s" style=anchorStyles target="_blank">{"Lonely polyglot trying to show-off on Youtube"->React.string}</a>
      </p>
      <Footer/>
    </Scrollview>
  </div>
}
