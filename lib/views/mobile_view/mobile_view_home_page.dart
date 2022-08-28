import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/views/mobile_view/read_news.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/all_providers/all_providers.dart';

class MobileViewHomePage extends ConsumerStatefulWidget {
  const MobileViewHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileViewHomePageState();
}

class _MobileViewHomePageState extends ConsumerState<MobileViewHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomePageController _homePageProvider = ref.read(homePageProvider);
    _homePageProvider.loadNews();
    UserController _userController = ref.read(userProvider);
    _userController.init();
  }

  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    HomePageController _homePageProvider = ref.watch(homePageProvider);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        iconTheme: IconThemeData(color: darkBlueColor),
        elevation: 0.0,
        title: Text(
          'Genesys Blog',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        backgroundColor: darkBlueColor,
      ),
      drawer: const Drawer(),
      body: _homePageProvider.load
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(100),
                CircularProgressIndicator(
                  color: darkBlueColor,
                ),
              ],
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            _key.currentState!.openDrawer();
                          },
                        ),
                        const Icon(Icons.search),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsWidget(
                      articleId: _homePageProvider.newsList![0]!.articleId,
                      userId: _homePageProvider.newsList![0]!.userId,
                      image: _homePageProvider.newsList![0]!.image,
                      body: _homePageProvider.newsList![0]!.body,
                      title: _homePageProvider.newsList![0]!.title,
                    ),
                  ),
                  Gap(20.h),
                  ListView.separated(
                    shrinkWrap: true,
                      separatorBuilder: (context, int) {
                        return const Divider();
                      },
                      itemCount: _homePageProvider.newsList!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                             Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MobileViewNews(
                                                  articleId: _homePageProvider
                                                      .newsList![index]!
                                                      .articleId
                                                      .toString(), editorsId:_homePageProvider
                                                      .newsList![index]!
                                                      .userId.toString() ,);
                                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 158,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('June 24, 2022'),
                                        Gap(8.h),
                                        TitleWidget(
                                          width: 530,
                                          fontSize: 12.sp,
                                          title: _homePageProvider
                                              .newsList![index]!.title!
                                              .substring(40),
                                        ),
                                        Gap(8.h),
                                        Text('Read More',
                                            style: TextStyle(color: lightBlue)),
                                      ],
                                    ),
                                  ),
                                  CachedNetworkImage(
                                    imageUrl: _homePageProvider
                                        .newsList![index]!.image
                                        .toString(),
                                    height: 100.h,
                                    width: 166.w,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
    );
  }
}
