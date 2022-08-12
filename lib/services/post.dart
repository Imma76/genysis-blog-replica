import 'dart:convert';

import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/models/news_model.dart';
import 'package:http/http.dart' as http;

class Post {
  // Future<NewsModel> postArticle()async{
  //   try{
  //     http.Response response = await http.MultipartRequest()
  //   }catch(e){

  //   }
  // }
  Future<List<NewsModel?>?> getPosts(String category) async {
    List<NewsModel?> newsModel = [];
    try {
      var response =
          await http.get(Uri.parse(baseUrl + 'post/category/$category'));
      // print(response.body);
      var decode = jsonDecode(response.body);
      //  print(decode);
      for (int post = 0; post < decode['body'].length; post++) {
       
        NewsModel model = NewsModel.fromJson(decode['body'][post]);
     
        newsModel.add(model);
      }
     
      return newsModel;
    
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
