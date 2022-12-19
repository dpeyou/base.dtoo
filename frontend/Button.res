// use this to add delay to functions. Functions = type of (unit => unit)
let setTimeout: (unit => unit, int) => unit = (_function, _time) =>
  %raw("window.setTimeout(
	_function,
	_time
)") /* time in milliseconds */

type state = {transform: string}

type action =
  | GrowButton
  | ShrinkButton

@react.component
let make = (
  ~theme: Types.theme,
  ~background=Theme.buttonBackground(theme),
  //
  ~alignItems="",
  ~bottom="",
  ~children: React.element=<> </>,
  ~className="",
  ~color="#000",
  ~display="",
  ~flexDirection="",
  ~fontSize="",
  ~height="",
  ~id="",
  ~justifyContent="",
  ~left="",
  ~margin="0.25rem",
  ~onClick: unit => unit=() => (),
  ~opacity="1",
  ~padding="0.35rem",
  ~pointerEvents="",
  ~position="relative",
  ~right="",
  ~tabIndex: int=0,
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
      transform: "scale(1.0)",
    },
  )

  // use this to detect changes to state.transform & trigger another action
  if state.transform === "scale(1.15)" {
    let function: unit => unit = () => {dispatch(ShrinkButton)}
    setTimeout(function, 125)
  }

  let buttonClick: ReactEvent.Mouse.t => unit = {_event => dispatch(GrowButton) |> onClick}

  let style = ReactDOM.Style.make(
    ~alignItems,
    ~background,
    ~border="2px solid",
    ~bottom,
    ~color,
    ~display,
    ~flexDirection,
    ~fontSize,
    ~height,
    ~justifyContent,
    ~left,
    ~margin,
    ~opacity,
    ~padding,
    ~pointerEvents,
    ~position,
    ~right,
    ~top,
    ~transform=state.transform,
    ~transition="125ms",
    ~width,
    (),
  )

  // -- VIEW
  <button id className={className ++ " button"} onClick=buttonClick style tabIndex>
    children
  </button>
}
