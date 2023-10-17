let () = {
  Dream.run(~port=3001) @@
  Dream.logger @@
  Dream.router([Dream.get("/", Common.sendArticles)]);
};
