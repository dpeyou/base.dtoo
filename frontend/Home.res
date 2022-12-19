/* NOTE:
*******
sttb = scroll-to-top button
sv = scrollView
*******
*/

@react.component
let make = (~layout: Types.layout, ~page: Types.page, ~theme: Types.theme) => {
  // variable attributes due to page
  let isCurrentPage: bool = page == Home
  let opacity = {isCurrentPage ? "1" : "0"}
  let pointerEvents = {isCurrentPage ? "auto" : "none"}
  let tabIndex = {isCurrentPage ? 0 : -1}
  let transform = {isCurrentPage ? "" : "translateX(-25px)"}

  // inline styles
  let anchorStyles = ReactDOM.Style.make(
    ~color=Theme.headingColor(theme),
    ~fontSize="110%",
    ~fontWeight="bold",
    (),
  )
  let headingStyles = ReactDOM.Style.make(
    ~color=Theme.headingColor(theme),
    ~fontSize="1.8rem",
    ~margin="1rem 0.25rem 0.5rem",
    (),
  )
  let headingStyles2 = ReactDOM.Style.make(
    ~color=Theme.appColor(theme),
    ~fontSize="1.05rem",
    ~fontWeight="bold",
    (),
  )
  let introStyles = ReactDOM.Style.make(
    ~background=Theme.textBlockBackground(theme),
    ~border="solid black",
    ~borderWidth="2px 0",
    ~fontSize="1.05rem",
    ~margin="0 0.25rem 3rem",
    ~padding="0.5rem",
    //~textAlign="center",
    (),
  )
  let introStyles2 = ReactDOM.Style.make(
    ~background=Theme.textBlockBackground(theme),
    ~border="solid black",
    ~borderWidth="2px 0",
    ~margin="0.25rem 0",
    ~padding="0.5rem",
    (),
  )
  let listStyles = ReactDOM.Style.make(~listStyle="inside", ~margin="0 0 1rem", ~padding="0", ())
  let listStyles2 = ReactDOM.Style.make(~margin="0 0 2.5rem", ~padding="0.5rem", ())
  let pageStyles = ReactDOM.Style.make(~opacity, ~pointerEvents, ())

  // variable attributes due to layout
  let isPortrait: bool = layout === Portrait
  let svBottom = {isPortrait ? "3rem" : "0"}
  let svRight = {isPortrait ? "0" : "40%"}
  let sttbRight = {isPortrait ? "0.1rem" : "41%"}

  // -- VIEW
  <div id="Home" style=pageStyles tabIndex>
    <Scrollview
      id="HomeScrollview"
      bottom=svBottom
      opacity
      pointerEvents
      right=svRight
      sttbRight
      tabIndex
      theme
      top="2.5em"
      transform>
      <h2 style=headingStyles> {"Hey, I'm Darren"->React.string} </h2>
      <h3 style=introStyles2> {"Web developer"->React.string} </h3>
      <h3 style=introStyles2> {"3D enthusiast"->React.string} </h3>
      <img
        alt="Darren-headshot"
        src="./images/darren.jpeg"
        style={ReactDOM.Style.make(
          ~border="solid #000",
          ~borderWidth="2px 6px",
          ~boxSizing="border-box",
          ~width="100%",
          (),
        )}
      />
      <p className="intro intro-text introduction" style=introStyles>
        {"I'm a tropical heat lover who enjoys short travels & language learning. Videogames are cool. 'Me ist minimalist'. Health is wealth. "->React.string}
      </p>
      <h2 style=headingStyles> {"What I do: "->React.string} </h2>
      <ul style=listStyles>
        <li>
          <b style=headingStyles2>
            {"WordPress plugin support & plugin contribution"->React.string}
          </b>
          <ul style=listStyles2>
            <li style=introStyles2>
              {"I have about 3 years of experience providing support for WordPress plugins through in-house channels & on free support forums. You can take a look at my wordpress.org profile here: "->React.string}
              <a
                href="https://wordpress.org/support/users/dpeyou/"
                style=anchorStyles
                target="_blank">
                {"WordPress profile"->React.string}
              </a>
            </li>
            <li style=introStyles2>
              {"To see a little more of my WordPress plugin support, click here: "->React.string}
              <a
                href="https://wordpress.org/support/users/dpeyou/replies/"
                style=anchorStyles
                target="_blank">
                {"Public WordPress plugin support"->React.string}
              </a>
              <img
                alt="plugin-support-image"
                src="./images/darren-forum-replies-light.png"
                style={ReactDOM.Style.make(
                  ~border="solid #000",
                  ~borderWidth="2px 0",
                  ~boxSizing="border-box",
                  ~margin="0.5rem",
                  ~width="90%",
                  (),
                )}
              />
            </li>
          </ul>
        </li>
        <li>
          <b style=headingStyles2> {"Full-stack web development"->React.string} </b>
          <ul style=listStyles2>
            <li style=introStyles2>
              {"The main tools I use for front-end development are JavaScript & ReasonML/Rescript. I built this website using the Rescript-React framework. The backend of this website was written in Rust using the ... framework. You can take a look at the source-code on GitHub, here: "->React.string}
              <a
                href="https://github.com/dpeyou?tab=repositories"
                style=anchorStyles
                target="_blank">
                {"Source code"->React.string}
              </a>
            </li>
            <li style=introStyles2>
              {"I can also handle managing website deployment. The Website is deployed to via a Virtual Machine from Vultr.com. Here's my referal link if you are a developer & are interested: "->React.string}
              <a href="https://www.vultr.com/?ref=8578920" style=anchorStyles target="_blank">
                {"Vultr Server Referal Code"->React.string}
              </a>
            </li>
          </ul>
        </li>
        <li>
          <b style=headingStyles2> {"3d modeling & animation"->React.string} </b>
          <ul style=listStyles2>
            <li style=introStyles2>
              {"I have been developing these skills as a hobby for my video game project. I use Blender for my 3D modeling & animation, then I test my assets in the UPBGE & Godot game engines"->React.string}
            </li>
            <li style=introStyles2>
              {"Let me introduce you to my very first videogame character. As a kid, I used to play a lot of Tomb Raider, so maybe this is an African version of one of my favorite games..? "->React.string}
              <br />
              <br />
              {"Say hello to Isoke, modeled & animated from scratch by me: "->React.string}
              <img
                alt="character-poster"
                src="./images/isk-rosegun.poster.png"
                style={ReactDOM.Style.make(
                  ~border="solid #000",
                  ~borderWidth="2px 0",
                  ~boxSizing="border-box",
                  ~margin="0.5rem",
                  ~width="90%",
                  (),
                )}
              />
              <img
                alt="jog-animation"
                src="./images/isk-jog-front.gif"
                style={ReactDOM.Style.make(
                  ~border="solid #000",
                  ~borderWidth="2px 0",
                  ~boxSizing="border-box",
                  ~margin="0.5rem",
                  ~width="90%",
                  (),
                )}
              />
            </li>
          </ul>
        </li>
      </ul>
      <section id="contact">
        <h2 style=headingStyles> {"Contact: "->React.string} </h2>
        <p style=introStyles>
          {"If you want to get in contact with me, send me an email at "->React.string}
        <a href="mailto: dpeyou@tutanota.com" style=anchorStyles>
          {"dpeyou@tutanota.com"->React.string}
        </a>
        </p>
      </section>
      <Footer />
    </Scrollview>
  </div>
}
