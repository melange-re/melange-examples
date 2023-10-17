module App = {
  // This sample forces an import of Belt.*, so that CI builds can ensure that
  // Melange has been installed correctly for JS bundlers to be able to find it.
  [@react.component]
  let make = () => {
    React.useEffect0(() => {
      (
        Fetch.get("http://localhost:3001/")
        |> Js.Promise.then_(res => {
             Js.log2(res, "es");
             Js.Promise.resolve(res);
           })
      )
      ->ignore;

      None;
    });
    ["Hello " ++ "!", "This is React!"]
    ->Belt.List.map(greeting => <h1> greeting->React.string </h1>)
    ->Belt.List.toArray
    ->React.array;
  };
};

ReactDOM.querySelector("#root")
->(
    fun
    | Some(root) => ReactDOM.render(<App />, root)
    | None =>
      Js.Console.error(
        "Failed to start React: couldn't find the #root element",
      )
  );
