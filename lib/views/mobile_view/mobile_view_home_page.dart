import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/views/desktop_view/authentication_view/sign_in.dart';
import 'package:genesys_blog/views/mobile_view/authentication_view/sign_in.dart';
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

  @override
  Widget build(BuildContext context) {
    HomePageController _homePageProvider = ref.watch(homePageProvider);
    UserController _userController = ref.watch(userProvider);
    return Scaffold(
        key: _homePageProvider.key,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
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
        drawer: Drawer(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: _userController.firstName == null
                  ? Column(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MobileSignIn();
                              }));
                            },
                            child: ListTile(
                              title: Text('Sign In',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red)),
                            )),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            _userController.photo.toString())),
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
                                Navigator.pop(context);

                                ///   _homePageProvider.changeIndex(0);
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
                              onTap: () {Navigator.pop(context);
                                 _homePageProvider.changeIndex(2);
                              },
                              child: ListTile(
                                title: Text('Dashboard',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: black)),
                              )),
                          const Gap(15),
                          GestureDetector(
                              onTap: () {Navigator.pop(context);
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
                              onTap: () {Navigator.pop(context);
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
                                await _userController.signOut();
                                Navigator.pop(context);
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
        body:
            _homePageProvider.mobileWidgetList[_homePageProvider.currentIndex]);
  }
}
