
import 'package:dio/dio.dart';
import 'package:news/Models/new_model.dart';

class NewsService
{
  static Dio dio = Dio();
  static Future<NewsModel> getModels() async
  {
    try{
      const url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7c64a4b2debe40168c74926def260cdf";
      var response = await dio.get(url);
      if(response.statusCode == 200)
        {
          return NewsModel.fromjson(response.data);
        }
      throw Exception("not found");
    }
    catch(e)
    {
      throw Exception(e.toString());
    }

  }
}