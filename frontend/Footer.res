@react.component
let make = () => {
	// inline styles
	let footerStyles = ReactDOM.Style.make(~background="black", ~color="white", ~padding="5rem 0 25rem", ~margin="0 -0.35rem -0.25rem", ~textAlign="center",())

	// -- VIEW
	<div id="Footer" style=footerStyles>
		<h2>{"Sponsored by "->React.string}</h2>
		<img
			alt="Starling-Enterprises-logo"
			src="./images/starling-enterprises-logo.png"
			style={ReactDOM.Style.make(
				~background="#fff",
				~boxSizing="border-box",
				~padding="22px 10px",
				~width="85%",
				(),
			)}
		/>
	</div>
}
