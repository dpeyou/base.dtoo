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
  ~theme: Theme.theme,
  ~background=Theme.buttonBackground(theme),
  ~color="#000",

  ~bottom="",
  ~children: React.element=<> </>,
  ~display="flex",
  ~fontSize="",
  ~height="",
  ~left="",
  ~margin="0.25rem",
  ~onClick: unit => unit=()=>(),
  ~padding="0.35rem",
  ~position="relative",
  ~right="",
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
    let function: unit => unit = () => {dispatch(ShrinkButton)};
    setTimeout(function, 125);
  }

  let buttonClick: ReactEvent.Mouse.t => unit = {_event => dispatch(GrowButton) |> onClick}

  let style = ReactDOM.Style.make(
    ~background,
    ~border="2px solid",
    ~bottom,
    ~color,
    ~display,
    ~fontSize,
    ~height,
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
  <button onClick=buttonClick style> children </button>
}
