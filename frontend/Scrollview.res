type state = {transform: string}

type action =
  | GrowButton
  | ShrinkButton

@react.component
let make = (
  ~bottom="",
  ~children: React.element=<> </>,
  ~className="",
  ~fontSize="",
  ~id="",
  ~left="",
  ~margin="0 0.25rem",
  ~padding="0.35rem",
  ~position="absolute",
  ~right="",
  ~theme: Theme.theme=Dark,
  ~top="",
  ~width="initial",
) => {
  let (state, dispatch) = React.useReducer(
    (_state, action) => {
      switch action {
      | GrowButton => {transform: "scale(1.15)"}
      | ShrinkButton => {transform: "scale(1.0)"}
      } // end switch action
    },
    // -- initial state
    {
      transform: "",
    },
  )

  let onScroll = _event => Js.log("scroll");

  let style = ReactDOM.Style.make(
    ~background=Theme.scrollviewBackground(theme),
    ~border=Theme.scrollviewBorder(theme),
    ~borderWidth="2px 0",
    ~bottom,
    ~color=Theme.scrollviewColor(theme),
    ~fontSize,
    ~left,
    ~margin,
    ~padding,
    ~position,
    ~right,
    ~top,
    ~transform=state.transform,
    ~transition="125ms",
    ~width,
    (),
  )

  // -- VIEW
  <div id className={className ++ " scrollview scrollView"} onScroll style> children </div>
}
