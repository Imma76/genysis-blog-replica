import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/utils/user_details.dart';
import 'package:genesys_blog/views/desktop_view/user_drafts.dart';
import 'package:genesys_blog/views/desktop_view/user_post.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopViewHomePage extends ConsumerStatefulWidget {
  const DesktopViewHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopViewPageState();
}

class _DesktopViewPageState extends ConsumerState<DesktopViewHomePage> {
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
    UserController _userController = ref.watch(userProvider);

    return Scaffold(
        key: _key,
        endDrawer: Drawer(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              child: CachedNetworkImage(
                                  imageUrl: _userController.photo.toString())),
                          const Gap(20),
                          Column(
                            children: [
                              Text(_userController.firstName.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: black)),
                              const Gap(5),
                              Text(_userController.email.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    GestureDetector(
                        onTap: () {
                          _homePageProvider.changeIndex(0);
                        },
                        child: ListTile(
                          title: Text('Home',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black)),
                        )),
                    const Gap(15),
                    GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: Text('Dashboard',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black)),
                        )),
                    const Gap(15),
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const UserPost();
                          // }));
                          _homePageProvider.changeIndex(1);
                        },
                        child: ListTile(
                          title: Text('Posts',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black)),
                        )),
                    const Gap(15),
                    GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const UserDrafts();
                          // }));
                          _homePageProvider.changeIndex(2);
                        },
                        child: ListTile(
                          title: Text('Drafts',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black)),
                        )),
                    const Gap(15),
                    GestureDetector(
                        onTap: () {
                          BotToast.showText(text: "xxxx");
                        },
                        child: ListTile(
                          title: Text('Profile settings',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: black)),
                        )),
                    const Gap(15),
                    GestureDetector(
                        onTap: () async {
                          await UserSharedPref.clear();
                        },
                        child: ListTile(
                          title: Text('Sign out',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red)),
                        )),
                  ]),
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize:
              const Size(double.infinity, 157.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(color: darkBlueColor),
            toolbarHeight: 157,
            backgroundColor: darkBlueColor,
            centerTitle: true,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(17.h),
                Padding(
                  padding: EdgeInsets.only(left: 120.w),
                  child: Text('Genesys Blog',
                      style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: white)),
                ),
                Gap(18.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () {
                          _homePageProvider.loadNews(category: 'news');
                        },
                        child: Text('News',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () async {
                          _homePageProvider.loadNews(category: 'politics');
                          //   await UserSharedPref.clear();
                        },
                        child: Text('Politics',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () {
                          _homePageProvider.loadNews(category: 'entertainment');
                        },
                        child: Text('Entertainment',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () {
                          _homePageProvider.loadNews(category: 'technology');
                        },
                        child: Text('Technology',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () {
                          _homePageProvider.loadNews(category: 'sports');
                        },
                        child: Text('Sports',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    Visibility(
                      visible: _homePageProvider.currentIndex == 0,
                      child: GestureDetector(
                        onTap: () {
                          _homePageProvider.loadNews(category: 'education');
                        },
                        child: Text('Education',
                            style: GoogleFonts.poppins(
                                fontSize: 20.sp, color: white)),
                      ),
                    ),
                    //Spacer(),
                    Visibility(
                      visible: _userController.firstName != null,

                      //   waitDuration: const Duration(seconds: 1),
                      // // showDuration: const Duration(seconds: 2),
                      // padding: const EdgeInsets.all(5),
                      // height: 35,
                      // textStyle: const TextStyle(
                      //     fontSize: 15,
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.normal),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.green),
                      // message:"kkk",
                      child: GestureDetector(
                        onTap: () {
                          _key.currentState!.openEndDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          _userController.photo.toString())),
                              const Gap(10),
                              Text(_userController.firstName.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: _homePageProvider.widgetList[_homePageProvider.currentIndex]);
  }
}
