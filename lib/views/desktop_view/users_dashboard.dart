import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class UserDashBoardDesktopView extends ConsumerStatefulWidget {
  const UserDashBoardDesktopView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserDashBoardDesktopViewState();
}

class _UserDashBoardDesktopViewState
    extends ConsumerState<UserDashBoardDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            height: 114,
            width: double.infinity,
            color: darkBlueColor,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(17),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('Genesys Blog',
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: white)),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(),
                        const Gap(10),
                        Text('Benard',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: white)),
                      ],
                    ),
                  )
                ],
              ),
            )),
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
                    color: black, fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const Gap(36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  DashboardMetricsWidget(
                    boxType: 'Posts',
                    imagePath: 'assets/post.png',
                    mertricNumber: '10',
                  ),
                  Spacer(),
                  DashboardMetricsWidget(
                    boxType: 'Drafts',
                    imagePath: 'assets/mail.png',
                    mertricNumber: '10',
                  ),
                  Spacer(),
                  DashboardMetricsWidget(
                    boxType: 'Post reactions',
                    imagePath: 'assets/reactions.png',
                    mertricNumber: '10',
                  ),
                  Spacer(),
                ],
              ),
              const Gap(40),
              Text(
                'Recently Created',
                style: GoogleFonts.poppins(
                    color: black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Gap(24),
              ListView.separated(
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, int) {
                    return Divider();
                  },
                  itemBuilder: (context, index) {
                    return RecentlyCreated();
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
            Gap(142),
            Text('Edit'),
            Gap(58),
            Text('Delete')
          ],
        ),
        Gap(10),
        Text('21 May')
      ],
    );
  }
}

class DashboardMetricsWidget extends StatelessWidget {
  final String imagePath, boxType, mertricNumber;
  final double? width;
  const DashboardMetricsWidget(
      {Key? key,
      required this.boxType,
      required this.imagePath,this.width = 310,
      required this.mertricNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154,
      width: width,
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                boxType,
                style: GoogleFonts.poppins(
                    color: white, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                mertricNumber,
                style: GoogleFonts.poppins(
                    color: white, fontSize: 30, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Image.asset(imagePath, width: 39, height: 42)
        ],
      ),
      decoration: BoxDecoration(
          color: darkBlueColor, borderRadius: BorderRadius.circular(20)),
    );
  }
}
