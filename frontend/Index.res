module App = {
  type layout =
    | Landscape
    | Portrait

  type state = {
    page: Header.page,
    layout: layout,
    theme: Theme.theme,
  }

  type action =
    | UpdateLayout(int)
    | UpdatePage(Header.page)
    | UpdateTheme(Theme.theme)

  let initialScreenWidth: int = %raw("window.document.body.clientWidth")
  let mediaQueryWidth: int = 700
  let onResize: (unit => unit) => unit = _function => %raw("window.onresize = _function")

  @react.component
  let make = () => {
    let (state, dispatch) = React.useReducer(
      (state, action) => {
        switch action {
        | UpdateLayout(screenWidth) =>
          {Js.log2("de witt iz: ", screenWidth)}
          {...state, layout: screenWidth < mediaQueryWidth ? Portrait : Landscape}

        | UpdatePage(page) => {
          switch page {
          | Home =>  LocalStorage.setItem("page", "Home")
          | Projects =>  LocalStorage.setItem("page", "Projects")
          }
        }

        { ...state, page}

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
        page: Home,
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

    let toggleTheme: unit => unit = () => {
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
      <Header page=state.page theme=state.theme />
      <Home theme=state.theme/>
      <Button onClick=toggleTheme theme=state.theme> {"Toggle_Theme"->React.string} </Button>
      {switch state.layout {
      | Portrait => <Navbar theme=state.theme />
      | Landscape => <> </>
      }}
    </div>
  }
}

// -- RENDER-TO-HTML FUNCTION
switch ReactDOM.querySelector("#AppContainer") {
| Some(node: Dom.element) =>
  ReactDOM.Client.createRoot(node) |> (root => ReactDOM.Client.Root.render(root, <App />))

| None => ()
}
