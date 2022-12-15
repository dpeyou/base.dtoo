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

  // styles
  let anchorStyles = ReactDOM.Style.make(~color=Theme.headingColor(theme), ())
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
    ~margin="0 0.25rem 2.5rem",
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
  let listStyles2 = ReactDOM.Style.make(~margin="0 0 1rem", ~padding="0.5rem", ())
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
      <h3 style=introStyles2> {"Freelancer"->React.string} </h3>
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
            <li style=introStyles2> {"HIJKLMNOP"->React.string} </li>
          </ul>
        </li>
        <li>
          <b style=headingStyles2> {"Full-stack web development"->React.string} </b>
          <ul style=listStyles2>
            <li style=introStyles2>
              {"The main tools I use for front-end development are JavaScript & ReasonML/Rescript. I built this website using Rescript-React. You can take a look at the source-code on GitHub, here: "->React.string}
              <a
                href="https://github.com/dpeyou?tab=repositories"
                style=anchorStyles
                target="_blank">
                {"Source code"->React.string}
              </a>
            </li>
            <li style=introStyles2>
              {"This website was deployed to a server purchased from Vultr, using Docker & CapRover."->React.string}
            </li>
          </ul>
        </li>
        <li>
          <b style=headingStyles2> {"3d modeling & animation"->React.string} </b>
          <ul style=listStyles2>
            <li style=introStyles2>
              {"I have been developing these skills as a hobby for my video game project. Do you know about Blender 3D?"->React.string}
            </li>
            <li style=introStyles2>
              {"Let me introduce you to my very first videogame character. Say hello to Isoke: "->React.string}
            </li>
          </ul>
        </li>
      </ul>
      <h2 style=headingStyles> {"Contact: "->React.string} </h2>
      <p>
        {"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non sodales neque sodales ut etiam sit amet nisl purus. Massa sapien faucibus et molestie ac feugiat sed. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit. Tempor nec feugiat nisl pretium fusce. Pharetra diam sit amet nisl suscipit. Velit sed ullamcorper morbi tincidunt ornare massa eget. Enim neque volutpat ac tincidunt vitae. Sit amet volutpat consequat mauris nunc congue nisi vitae. Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Ipsum suspendisse ultrices gravida dictum fusce ut. In iaculis nunc sed augue. Urna duis convallis convallis tellus id interdum velit laoreet id.

Id neque aliquam vestibulum morbi blandit cursus risus at ultrices. Sit amet venenatis urna cursus eget nunc s

Velit ut tortor pretium viverra suspendisse. Sed euismod nisi porta lorem. Mi sit amet mauris commodo quis imperdiet massa tincidunt nunc. Donec ultrices tincidunt arcu non. Nam libero justo laoreet sit. Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor. Nulla porttitor massa id neque aliquam vestibulum. Ut lectus arcu bibendum at varius. Suspendisse faucibus interdum posuere lorem ipsum dolor. Donec et odio pellentesque diam. A scelerisque purus semper eget duis at tellus. Amet mattis vulputate enim nulla aliquet porttitor lacus. Tincidunt praesent semper feugiat nibh. Ultrices gravida dictum fusce ut. Risus feugiat in ante metus dictum at tempor. Sodales ut etiam sit amet nisl purus. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Habitasse platea dictumst quisque sagittis purus. Auctor urna nunc id cursus metus aliquam eleifend mi in."->React.string}
      </p>
      <Footer />
    </Scrollview>
  </div>
}
