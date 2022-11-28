Js.log("Hellur")

module Button = {
  @react.component
  let make = (~count: int) => {
    let times = switch count {
    | 1 => "once"
    | 2 => "twice"
    | n => Belt.Int.toString(n) ++ " times"
    }
    let msg = "Click me " ++ times

    <button> {msg->React.string} </button>
  }
}

switch(ReactDOM.querySelector("body")) {
| Some(body) => ReactDOM.render(<Button count=0 />, body)
| None => ()
};