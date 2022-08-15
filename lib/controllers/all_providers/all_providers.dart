import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genesys_blog/controllers/comment_controller.dart';
import 'package:genesys_blog/controllers/drafts_controller.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';

final homePageProvider =
    ChangeNotifierProvider<HomePageController>((ref) => HomePageController());
final userProvider =
    ChangeNotifierProvider<UserController>((ref) => UserController());
final postProvider = ChangeNotifierProvider<PostController>((ref) => PostController());
final draftsProvider = ChangeNotifierProvider<DraftsController>((ref) => DraftsController());

final commentProvider = ChangeNotifierProvider<CommentController>((ref) => CommentController());