
let onResize: (unit => unit) => unit = _function => %raw("window.onresize = _function")

type state = {
  count: int,
  layout: Types.layout,
}

type action =
  | Tick
  | UpdateLayout(int)

module App = {
  @react.component
  let make = () => {
    let (state, dispatch) = React.useReducer(
      (state, action) => {
        switch action {
        | Tick => {...state, count: state.count + 1}
        | UpdateLayout(width) =>
          {Js.log2("de witt iz: ", width)}
          {...state, layout: width < 300 ? Portrait : Landscape}
        }
      },
      // -- initial state
      {
        count: 0,
        layout: Portrait,
      },
    )

    // window.onresize
    onResize(() => dispatch(UpdateLayout(%raw("window.document.body.clientWidth"))))

    /* useEffect hook takes 0 arguments hence, useEffect0 */
    React.useEffect0(() => {
      let timerId = Js.Global.setInterval(() => dispatch(Tick), 1000)
      Some(() => Js.Global.clearInterval(timerId))
    })

    // -- VIEW

    <>
      <h1> {"base.dtoo"->React.string} </h1>
      <div> {React.string(string_of_int(state.count))} </div>
    </>
  }
}

// -- RENDER-TO-HTML FUNCTION

switch ReactDOM.querySelector("#appContainer") {
| Some(node: Dom.element) =>
  ReactDOM.Client.createRoot(node) |> (root => ReactDOM.Client.Root.render(root, <App />))

| None => ()
}
