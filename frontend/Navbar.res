@react.component
let make = (~theme) => {
	let style = ReactDOM.Style.make(
		~bottom="0",
		~color="red",
		~position="absolute",
		(),
	);


	// -- VIEW
	<>
		<div style> {"Navbar"->React.string} </div>
	</>
}