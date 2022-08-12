import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:genesys_blog/controllers/home_page_provider.dart';

final homePageProvider =
    ChangeNotifierProvider<HomePageProvider>((ref) => HomePageProvider());
