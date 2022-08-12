import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_view/desktop_view_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   // final HomePageProvider homeProvider = ref.read(homePageProvider);
  // }

  @override
  Widget build(BuildContext context) {
    //final HomePageProvider homeProvider = ref.watch(homePageProvider);
    return ScreenTypeLayout(
      desktop: const DesktopViewHomePage(),
      mobile: Scaffold(
        body: Container(
          child: Column(
            children: const [Text('Genesys Blog')],
          ),
        ),
      ),
    );
  }
}

