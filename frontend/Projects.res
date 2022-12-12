@react.component
let make = (~page: Header.page, ~theme: Theme.theme) => {
  let isCurrentPage: bool = page == Projects
  let opacity = {isCurrentPage ? "1" : "0"}
  let pointerEvents = {isCurrentPage ? "auto" : "none"}
  let tabIndex = {isCurrentPage ? -1 : 0}
  let transform = {isCurrentPage ? "" : "translateX(25px)"}

  let pageStyles = ReactDOM.Style.make(
    ~opacity,
    ~pointerEvents,
    //~position,
    //~right,
    //~top,
    //~transform,
    ~transition="125ms",
    //~width,
    //~zIndex,
    (),
  )

  // -- VIEW
  <div id="Projects" style=pageStyles tabIndex>
    <Scrollview
      id="ProjectsScrollview"
      bottom="3rem"
      opacity
      pointerEvents
      tabIndex
      theme
      top="2.5em"
      transform>
      <p> {"The thangs I'm workin' on"->React.string} </p>
      <p>
        {"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non sodales neque sodales ut etiam sit amet nisl purus. Massa sapien faucibus et molestie ac feugiat sed. Eget felis eget nunc lobortis mattis aliquam faucibus purus. Molestie ac feugiat sed lectus vestibulum mattis ullamcorper velit. Tempor nec feugiat nisl pretium fusce. Pharetra diam sit amet nisl suscipit. Velit sed ullamcorper morbi tincidunt ornare massa eget. Enim neque volutpat ac tincidunt vitae. Sit amet volutpat consequat mauris nunc congue nisi vitae. Ultricies lacus sed turpis tincidunt id aliquet risus feugiat. Ipsum suspendisse ultrices gravida dictum fusce ut. In iaculis nunc sed augue. Urna duis convallis convallis tellus id interdum velit laoreet id.

Id neque aliquam vestibulum morbi blandit cursus risus at ultrices. Sit amet venenatis urna cursus eget nunc scelerisque. Amet nulla facilisi morbi tempus. Risus in hendrerit gravida rutrum quisque non tellus orci ac. In ornare quam viverra orci sagittis eu volutpat. Tincidunt dui ut ornare lectus sit amet est placerat. Turpis massa sed elementum tempus. Quisque id diam vel quam elementum pulvinar etiam. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Arcu cursus vitae congue mauris rhoncus aenean. Nulla posuere sollicitudin aliquam ultrices sagittis. Pellentesque massa placerat duis ultricies lacus sed turpis tincidunt. Facilisis volutpat est velit egestas dui id. Ornare arcu dui vivamus arcu felis bibendum.

Dui faucibus in ornare quam viverra. Pellentesque massa placerat duis ultricies lacus sed turpis. Elementum integer enim neque volutpat ac tincidunt. Aliquam etiam erat velit scelerisque in. Enim neque volutpat ac tincidunt vitae semper quis lectus nulla. Mauris sit amet massa vitae tortor condimentum lacinia. Enim nec dui nunc mattis enim ut. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada. Eget felis eget nunc lobortis mattis aliquam faucibus purus in. Aenean pharetra magna ac placerat vestibulum.

Eget egestas purus viverra accumsan in nisl. Massa sed elementum tempus egestas sed sed risus pretium quam. Morbi enim nunc faucibus a pellentesque sit amet porttitor eget. Fermentum et sollicitudin ac orci phasellus egestas tellus rutrum. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Et odio pellentesque diam volutpat. Nulla pellentesque dignissim enim sit amet venenatis. Consectetur purus ut faucibus pulvinar elementum integer enim neque. Augue eget arcu dictum varius. Imperdiet massa tincidunt nunc pulvinar. Nec feugiat nisl pretium fusce id velit. Euismod nisi porta lorem mollis. Massa vitae tortor condimentum lacinia quis vel eros donec ac.

Velit ut tortor pretium viverra suspendisse. Sed euismod nisi porta lorem. Mi sit amet mauris commodo quis imperdiet massa tincidunt nunc. Donec ultrices tincidunt arcu non. Nam libero justo laoreet sit. Mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor. Nulla porttitor massa id neque aliquam vestibulum. Ut lectus arcu bibendum at varius. Suspendisse faucibus interdum posuere lorem ipsum dolor. Donec et odio pellentesque diam. A scelerisque purus semper eget duis at tellus. Amet mattis vulputate enim nulla aliquet porttitor lacus. Tincidunt praesent semper feugiat nibh. Ultrices gravida dictum fusce ut. Risus feugiat in ante metus dictum at tempor. Sodales ut etiam sit amet nisl purus. Pharetra vel turpis nunc eget lorem dolor sed viverra ipsum. Habitasse platea dictumst quisque sagittis purus. Auctor urna nunc id cursus metus aliquam eleifend mi in."->React.string}
      </p>
    </Scrollview>
  </div>
}
