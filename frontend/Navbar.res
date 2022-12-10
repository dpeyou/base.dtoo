@react.component
let make = (~theme) => {
	let style = ReactDOM.Style.make(
		~background=Theme.appBackground(theme),
		~bottom="0",
		~color=Theme.appColor(theme),
		~position="absolute",
		(),
	);


	// -- VIEW
	<>
		<div style> {"Navbar"->React.string} </div>
	</>
}