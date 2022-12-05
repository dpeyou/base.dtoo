
module App = {
	let initialScreenWidth: int = %raw("window.document.body.clientWidth");
	let mediaQueryWidth: int = 700;
	let onResize: (unit => unit) => unit = _function => %raw("window.onresize = _function")

	type state = {
		//count: int,
		layout: Types.layout,
		theme: Types.theme,
	}

	type action =
	//| Tick
	| UpdateLayout(int)

	@react.component
	let make = () => {
		let (state, dispatch) = React.useReducer(
			(state, action) => {
				switch action {
				//| Tick => {...state, count: state.count + 1}
				| UpdateLayout(screenWidth) =>
					{ Js.log2("de witt iz: ", screenWidth)}
					{...state, layout: screenWidth < mediaQueryWidth ? Portrait : Landscape}
				}
			},
			// -- initial state
			{
				//count: 0, related to Tick action
				layout: initialScreenWidth < mediaQueryWidth ? Portrait : Landscape,
				theme: Dark,
			},
		)

		// window.onresize
		onResize(() => dispatch(UpdateLayout(%raw("window.document.body.clientWidth"))))

		/* useEffect hook takes 0 arguments hence, useEffect0 */
		/*
		React.useEffect0(() => {
			let timerId = Js.Global.setInterval(() => dispatch(Tick), 1000)
			Some(() => Js.Global.clearInterval(timerId))
		})
		*/

		// -- VIEW

		<>
			<h1> {"base.dtoo"->React.string} </h1>
			{switch state.layout {
			| Portrait => <footer> {"Dis da foota"->React.string} </footer>
			| Landscape => <> </>
			}}
		</>
	}
}

// -- RENDER-TO-HTML FUNCTION

switch ReactDOM.querySelector("#appContainer") {
| Some(node: Dom.element) =>
	ReactDOM.Client.createRoot(node) |> (root => ReactDOM.Client.Root.render(root, <App />))

| None => ()
}
