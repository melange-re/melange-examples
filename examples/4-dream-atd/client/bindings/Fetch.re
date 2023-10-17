type nonrec response;

[@send] external json: response => Js.Promise.t(Js.Json.t) = "json";

[@val]
external fetch: (string, Js.t({..})) => Js.Promise.t(response) = "fetch";

let get = url =>
  Js.Promise.(
    fetch(url, {"method": "GET"}) |> then_(json) |> catch(Js.log)
  );
