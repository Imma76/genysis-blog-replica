import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/all_providers/all_providers.dart';

class MobileUserPosts extends ConsumerStatefulWidget {
  const MobileUserPosts({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPostsState();
}

class _UserPostsState extends ConsumerState<MobileUserPosts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     PostController postController = ref.read(postProvider);
    postController.getUserPosts();
    UserController _userController = ref.read(userProvider);
  }
  @override
  Widget build(BuildContext context) {
      PostController postController = ref.watch(postProvider);
    UserController _userController = ref.watch(userProvider);
    return Scaffold(
      body: Container(
          child:  postController.load
          ? Center(
              child: CircularProgressIndicator(
              color: darkBlueColor,
            ))
          : Padding(
        padding: const EdgeInsets.only(left:15.0,right:15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Posts',
              style: GoogleFonts.poppins(
                  color: black, fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const Gap(30),
             DashboardMetricsWidget(
              width: 291,
              boxType: 'Posts',
              imagePath: 'assets/post.png',
              mertricNumber:  '${postController.userPosts!.length}',
            ),
            Gap(20.h), Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Posts',
                  style: GoogleFonts.poppins(
                      color: black, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Create New Post',
                  style: GoogleFonts.poppins(
                      color: black, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
             const Gap(50),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              width: 391,
                              child: postController.userPosts!.isEmpty
                                  ? Column(
                                      children: [
                                        Image.asset('assets/nothing-found.png',
                                            height: 300),
                                        Text('You have no Post',
                                            style: GoogleFonts.poppins(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                color: black)),
                                      ],
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          postController.userPosts!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: UserPostsWidget(
                                            views: postController
                                                .userPosts![index]!.views
                                                .toString(),
                                            articleId: postController
                                                .userPosts![0]!.articleId,
                                          ),
                                        );
                                      }),
                            ),
          ],
        ),
      )),
    );
  }
}
