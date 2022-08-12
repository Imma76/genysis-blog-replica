import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/home_page_provider.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'desktop_view/desktop_view.dart';

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
      desktop: DesktopView(),
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

