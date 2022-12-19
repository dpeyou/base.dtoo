@react.component
let make = () => {
  // inline styles
  let anchorStyles = ReactDOM.Style.make(
    ~color="#ffe0a0",
    ~display="block",
    ~fontSize="1.5rem",
    ~margin="1rem 0",
    (),
  )
  let footerStyles = ReactDOM.Style.make(
    ~background="black",
    ~color="white",
    ~padding="5rem 0 25rem",
    ~margin="7rem -0.35rem -0.25rem",
    ~textAlign="center",
    (),
  )
  let sectionStyles = ReactDOM.Style.make(
    ~margin="0 0 15rem",
    (),
  )
  let starlingStyles = ReactDOM.Style.make(
    ~background="#fff",
    ~boxSizing="border-box",
    ~marginBottom="1rem",
    ~padding="22px 10px",
    ~width="85%",
    (),
  )

  // -- VIEW
  <div id="Footer" style=footerStyles>
    <section id="Sponsors" style=sectionStyles>
      <h2> {"Proudly Sponsored by "->React.string} </h2>
      <a>
        <img
          alt="Starling-Enterprises-logo"
          src="./images/starling-enterprises-logo.png"
          style=starlingStyles
        />
      </a>
    </section>
    <section className="socials credits" style=sectionStyles>
      <a href="https://github.com/dpeyou?tab=repositories" style=anchorStyles target="_blank">
        {"GitHub"->React.string}
      </a>
      <a href="https://www.vultr.com/?ref=8578920" style=anchorStyles target="_blank">
        {"Vultr"->React.string}
      </a>
    </section>
  </div>
}
