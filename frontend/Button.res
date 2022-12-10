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
  ~bottom="",
  ~children: React.element=<> </>,
  ~fontSize="",
  ~left="",
  ~margin="0.25rem",
  ~onClick: unit => unit,
  ~padding="0.35rem",
  ~position="relative",
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
      transform: "scale(1.0)",
    },
  )

  /*
	let _x = React.useEffect0(() => {
		let timerId = Js.Global.setInterval(() => dispatch(ShrinkButton), 200)
		Some(() => Js.Global.clearInterval(timerId))
	})*/

  // use this to detect changes to state.transform & trigger another action
  if state.transform === "scale(1.15)" {
    let action: unit => unit = () => {dispatch(ShrinkButton)}
    setTimeout(action, 175)
  }

  let buttonClick: ReactEvent.Mouse.t => unit = {_event => dispatch(GrowButton) |> onClick}

  let style = ReactDOM.Style.make(
    ~background=Theme.buttonBackground(theme),
    ~border="2px solid",
    ~bottom,
    ~color="#000",
    ~fontSize,
    ~left,
    ~margin,
    ~padding,
    ~position,
    ~right,
    ~top,
    ~transform=state.transform,
    ~transition="175ms",
    ~width,
    (),
  )

  // -- VIEW
  <button onClick=buttonClick style> children </button>
}
