type state = {
  scrollTop: int, /* when the scrollTop is above a certain distance, we can then make the scroll-to-top button appear */
} 
type action = GetScrollTop(int)

@react.component
let make = (
  ~theme: Theme.theme /* the following 2use this prop for default value */,
  ~background=Theme.scrollviewBackground(theme),
  ~color=Theme.appColor(theme),
  //
  ~bottom="",
  ~children: React.element=<> </>,
  ~className="",
  ~display="",
  ~fontSize="",
  ~id,
  ~left="0",
  ~margin="0 0.25rem",
  ~opacity="1",
  ~overflowX="hidden",
  ~overflowY="scroll",
  ~padding="0.35rem",
  ~pointerEvents="",
  ~position="absolute",
  ~right="0",
  ~tabIndex: int=0,
  ~top="",
  ~transform="",
  ~width="initial",
  ~zIndex="",
) => {
  let (state, dispatch) = React.useReducer(
    (_state, action) => {
      switch action {
      | GetScrollTop(newScrollTop) => {scrollTop: newScrollTop}
      } // end switch action
    },
    // -- initial state
    {
      scrollTop: {
        switch ReactDOM.querySelector(id) {
        | Some(_node: Dom.element) => %raw("_node.scrollTop")
        | None => 0
        }
      },
    },
  )

  //inline styles for scrollview
  let style = ReactDOM.Style.make(
    ~background,
    ~border="2px solid #000",
    ~borderWidth="2px 0",
    ~bottom,
    ~color,
    ~display,
    ~fontSize,
    ~left,
    ~margin,
    ~opacity,
    ~overflowX,
    ~overflowY,
    ~padding,
    ~pointerEvents,
    ~position,
    ~right,
    ~top,
    ~transform,
    ~transition="125ms",
    ~width,
    ~zIndex,
    (),
  )

  // -- SVG
  let upArrowIcon =
    <svg
      className="feather feather-arrow-up"
      fill="none"
      height="100%"
      stroke="currentColor"
      strokeLinecap="round"
      strokeLinejoin="round"
      strokeWidth="2"
      viewBox="0 0 24 24"
      width="100%"
      xmlns="http://www.w3.org/2000/svg">
      <line x1="12" y1="19" x2="12" y2="5" />
      <polyline points="5 12 12 5 19 12" />
    </svg>

  let onScroll: ReactEvent.UI.t => unit = _scroll =>
    dispatch(GetScrollTop(%raw("_scroll.target.scrollTop")))

  let scrollToTop: unit => unit = () =>
    switch ReactDOM.querySelector(id) {
    | Some(_scrollview) => %raw("function(){_scrollview.scrollTop = 0}") |> (() => Js.log("sxxs"))
    | None => () |> (() => Js.log("failed to find"))
    }

  let scrolledAlot: bool = state.scrollTop > 500


  // -- VIEW
  <>
    <div id className={className ++ " scrollview scrollView"} onScroll style tabIndex>
      children
    </div>
    <Button
      bottom="7rem"
      className="scroll-to-top sttb"
      height="2.5rem"
      onClick=scrollToTop
      opacity={scrolledAlot ? "1" : "0"}
      pointerEvents={scrolledAlot ? "auto" : "none"}
      position="absolute"
      right="0.1rem"
      tabIndex={scrolledAlot ? 0 : -1}
      theme
      width="4rem">
      upArrowIcon
    </Button>
  </>
}
