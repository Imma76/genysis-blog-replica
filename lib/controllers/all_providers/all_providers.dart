import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';

final homePageProvider =
    ChangeNotifierProvider<HomePageProvider>((ref) => HomePageProvider());
final userProvider =
    ChangeNotifierProvider<UserProvider>((ref) => UserProvider());
