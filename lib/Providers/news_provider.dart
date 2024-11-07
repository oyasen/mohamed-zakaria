import 'package:flutter/widgets.dart';
import 'package:news/Models/new_model.dart';
import 'package:news/Services/news_service.dart';

class NewsProvider extends ChangeNotifier
{
  NewsModel? articuls;
  Future<void> getdata() async
  {
    articuls = await NewsService.getModels();
    notifyListeners();
  }
}