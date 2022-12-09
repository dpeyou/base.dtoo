module App = {
  type layout =
    | Landscape
    | Portrait

  let initialScreenWidth: int = %raw("window.document.body.clientWidth")
  let mediaQueryWidth: int = 700
  let onResize: (unit => unit) => unit = _function => %raw("window.onresize = _function")

  type state = {
    layout: layout,
    theme: Theme.theme,
  }

  type action =
    | UpdateLayout(int)
    | UpdateTheme(Theme.theme)

  @react.component
  let make = () => {
    let (state, dispatch) = React.useReducer(
      (state, action) => {
        switch action {
        | UpdateLayout(screenWidth) =>
          {Js.log2("de witt iz: ", screenWidth)}
          {...state, layout: screenWidth < mediaQueryWidth ? Portrait : Landscape}

        | UpdateTheme(theme) =>
          {
            switch theme {
            | Dark => LocalStorage.setItem("theme", "Dark")
            | Light => LocalStorage.setItem("theme", "Light")
            }
          }

          {...state, theme}
        } // end switch action
      },
      // -- initial state
      {
        layout: initialScreenWidth < mediaQueryWidth ? Portrait : Landscape,
        theme: switch LocalStorage.getItem("theme") {
        | "Dark" => Dark
        | "Light" => Light
        | _anyThingElse => Dark
        },
      },
    )

    // window.onresize
    // onResize: (unit => unit) => unit
    onResize(() => dispatch(UpdateLayout(%raw("window.document.body.clientWidth"))))

    let toggleTheme: ReactEvent.Mouse.t => unit = _event => {
      state.theme == Dark ? dispatch(UpdateTheme(Light)) : dispatch(UpdateTheme(Dark))
    }

    // inline styles
    let style = ReactDOM.Style.make(
      ~background=Theme.appBackground(state.theme),
      ~bottom="0",
      ~color=Theme.appColor(state.theme),
      ~left="0",
      ~position="absolute",
      ~right="0",
      ~top="0",
      (),
    )

    // -- VIEW
    <div id="App" style>
      <h1> {"base.dtoo"->React.string} </h1>
      <button onClick=toggleTheme> {"Toggle_Theme"->React.string} </button>
      {switch state.layout {
      | Portrait => <Navbar theme=state.theme />
      | Landscape => <> </>
      }}
    </div>
  }
}

// -- RENDER-TO-HTML FUNCTION
switch ReactDOM.querySelector("#appContainer") {
| Some(node: Dom.element) =>
  ReactDOM.Client.createRoot(node) |> (root => ReactDOM.Client.Root.render(root, <App />))

| None => ()
}
