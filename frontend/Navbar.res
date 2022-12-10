@react.component
let make = (~theme) => {
	let style = ReactDOM.Style.make(
		~alignItems="center",
		//~background=Theme.appBackground(theme),
		~bottom="0",
		~color=Theme.appColor(theme),
		~display="flex",
		~height="2.5rem",
		~justifyContent="space-between",
		~left="0",
		~margin="0 0.35rem",
		~position="absolute",
		~right="0",
		(),
	);


	// -- VIEW
	<>
		<div id="Navbar" className="navigation" style> {"Navbar"->React.string} </div>
	</>
}