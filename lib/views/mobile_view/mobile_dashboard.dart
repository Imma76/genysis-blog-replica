import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/drafts_controller.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';


class MobileDashboard extends ConsumerStatefulWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends ConsumerState<MobileDashboard> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostController postController = ref.read(postProvider);
    DraftsController _draftProvider = ref.read(draftsProvider);
    _draftProvider.getDrafts();
    postController.getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
  PostController postController = ref.watch(postProvider);
    DraftsController _draftProvider = ref.watch(draftsProvider);
   
    return SingleChildScrollView(
      child: postController.load && _draftProvider.load
          ? Center(
              child: CircularProgressIndicator(
              color: darkBlueColor,
            ))
          : Column(children: [
              const Gap(39),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Home',
                          style: GoogleFonts.poppins(
                              color: lightGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        Image.asset(
                          'assets/divider.png',
                          height: 30,
                        ),
                        const Text('Dashboard')
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Dashboard',
                      style: GoogleFonts.poppins(
                          color: black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                    const Gap(36),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DashboardMetricsWidget(
                          boxType: 'Posts',
                          imagePath: 'assets/post.png',
                          mertricNumber:
                              postController.userDetails!.postLength.toString(),
                        ),
                        Spacer(),
                        DashboardMetricsWidget(
                          boxType: 'Drafts',
                          imagePath: 'assets/mail.png',
                          mertricNumber:
                              _draftProvider.draftsList!.length.toString(),
                        ),
                        Spacer(),
                        DashboardMetricsWidget(
                          boxType: 'Post reactions',
                          imagePath: 'assets/reactions.png',
                          mertricNumber: postController
                              .userDetails!.postReactions
                              .toString(),
                        ),
                        Spacer(),
                      ],
                    ),
                    const Gap(40),
                    Text(
                      'Recently Created',
                      style: GoogleFonts.poppins(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const Gap(24),
                    ListView.separated(
                        shrinkWrap: true,
                        itemCount: postController.userDetails!.postList!.length,
                        separatorBuilder: (context, int) {
                          return const Divider();
                        },
                        itemBuilder: (context, index) {
                          return const RecentlyCreated();
                        })
                  ],
                ),
              )
            ]),
    );
  }
}

class RecentlyCreated extends StatelessWidget {
  const RecentlyCreated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Etiam fusce faucibus eget cras. Feugiat sit sodales mauris, vitae, feugiat c Arcu et, sollicitudin odio lacus.',
              style: GoogleFonts.poppins(
                  color: black, fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Gap(142),
            const Text('Edit'),
            const Gap(58),
            const Text('Delete')
          ],
        ),
        const Gap(10),
        const Text('21 May')
      ],
    );
  }
}