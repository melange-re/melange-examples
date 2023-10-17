let example1: Article_t.t = {title: "first", body: "foo"};
let example2: Article_t.t = {title: "second", body: "bar"};

let article_list = [example1, example2];

let sendArticles = _request => {
  article_list |> Article_j.string_of_articles |> Dream.json;
};
