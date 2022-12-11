type state = {scrollTop: int} /* when the scrollTop is above a certain distance, we can then make the scroll-to-top button appear */
type action = GetScrollTop(int)

@react.component
let make = (
  ~theme: Theme.theme, /*the following 2use this prop for default value*/
  ~background=Theme.scrollviewBackground(theme),
  ~color=Theme.appColor(theme),
  //
  ~bottom="",
  ~children: React.element=<> </>,
  ~className="",
  ~display="",
  ~fontSize="",
  ~id="",
  ~left="0",
  ~margin="0 0.25rem",
	~opacity="1",
  ~overflowX="hidden",
  ~overflowY="scroll",
  ~padding="0.35rem",
  ~pointerEvents="",
  ~position="absolute",
  ~right="0",
	~tabIndex:int=0,
  ~top="",
  ~transform="",
  ~width="initial",
  ~zIndex="",
) => {
  let (_state, dispatch) = React.useReducer(
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

  let onScroll: ReactEvent.UI.t => unit = _scroll =>
    dispatch(GetScrollTop(%raw("_scroll.target.scrollTop")))

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

  // -- VIEW
  <div id className={className ++ " scrollview scrollView"} onScroll style tabIndex> children </div>
}
