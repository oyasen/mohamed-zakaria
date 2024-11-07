class NewsModel
{
  List<dynamic> articles;
  NewsModel({required this.articles});
  factory NewsModel.fromjson(Map<String,dynamic> json)
  {
    var fullData = json["articles"].map((user)
    {
      return
          {
            "title":user["title"],
            "description":user["description"],
            "Image":user["urlToImage"],
          };
    }
    ).toList();
    return NewsModel(articles: fullData);
  }
}