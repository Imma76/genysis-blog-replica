import 'dart:convert';
import 'dart:io';

import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/models/post_model.dart';
import 'package:genesys_blog/models/post_model.dart';
import 'package:genesys_blog/models/user_model.dart';
import 'package:genesys_blog/utils/user_details.dart';
import 'package:http/http.dart' as http;

import '../models/user_details_model.dart';

class PostService {
  // Future<NewsModel> postArticle()async{
  //   try{
  //     http.Response response = await http.MultipartRequest()
  //   }catch(e){

  //   }
  // }
  Future<List<PostsModel?>?> getPosts(String category) async {
    List<PostsModel?> newsModel = [];
    try {
      var response =
          await http.get(Uri.parse(baseUrl + 'post/category/$category'));
      // print(response.body);
      var decode = jsonDecode(response.body);
      //  print(decode);
      for (int post = 0; post < decode['body'].length; post++) {
        PostsModel model = PostsModel.fromJson(decode['body'][post]);

        newsModel.add(model);
      }

      return newsModel;
    } on SocketException {
      print('no internet');
      return null;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<PostsModel?> getPostsById(String id) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + 'post/id/$id'));
      // print(response.body);
      var decode = jsonDecode(response.body);
      print(decode);
      //for (int post = 0; post < decode['body'].length; post++) {

      PostsModel model = PostsModel.fromJson(decode['body']);

      //newsModel.add(model);
      //}

      return model;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<PostsModel?>?> getUserPosts() async {
    List<PostsModel?> postList = [];
    try {
      UserModel _userData = await UserSharedPref.getUser();
      print(_userData.userId);
      var response = await http.get(
          Uri.parse(baseUrl + 'post/userpost/${_userData.userId}'),
          headers: {'Authorization': 'Bearer ${_userData.token}'});
      var decode = jsonDecode(response.body);
      if (decode['body'] == 'no post found') {
        return postList;
      }
      for (int post = 0; post < decode['body'].length; post++) {
        PostsModel _posts = PostsModel.fromJson(
          decode['body'][post],
        );

        postList.add(_posts);
      }
      return postList;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<UserDetails?> getUserDetails() async {
    List<PostsModel?> postList = [];
    try {
      UserModel _userData = await UserSharedPref.getUser();
      print(_userData.userId);
      var response = await http.get(
        Uri.parse(baseUrl + 'users/${_userData.userId}'),
        // headers: {
        //   'Authorization':'Bearer ${_userData.token}'
        // }
      );
      var decode = jsonDecode(response.body);
    //  print(decode);
      // if (decode['body'] == 'no post found') {
      //   return postList;
      // }
      //for (int post = 0; post < decode['body']['userPost'].length; post++) {
        for (int i = 0; i < decode['body']['userPost'].length; i++) {
      PostsModel _postList = PostsModel.fromJson(decode['body']['userPost'][i]);
      postList.add(_postList);
     
    }
      UserDetails userDetails = UserDetails.fromJson(decode['body'], postList);

      //}
      return userDetails;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
