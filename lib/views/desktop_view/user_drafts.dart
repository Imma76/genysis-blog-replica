import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/drafts_controller.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:genesys_blog/widgets/category.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class UserDrafts extends ConsumerStatefulWidget {
  const UserDrafts({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserDraftsState();
}

class _UserDraftsState extends ConsumerState<UserDrafts> {
  List filterOption = [];
  bool selected = false;

  TextStyle textStyle = GoogleFonts.poppins(
      color: lightGrey, fontWeight: FontWeight.w400, fontSize: 12);
  TextAlign textAlign = TextAlign.start;
  String description = 'My great package';
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DraftsController _draftProvider = ref.read(draftsProvider);
    _draftProvider.getDrafts();
  }

  @override
  Widget build(BuildContext context) {
    DraftsController _draftProvider = ref.watch(draftsProvider);
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 44.0),
      child: _draftProvider.load
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
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Gap(20),
              const DashboardMetricsWidget(
                width: 391,
                boxType: 'Drafts',
                imagePath: 'assets/post.png',
                mertricNumber: '10',
              ),
              Gap(70),
              Text(
                'All Drafts',
                style: GoogleFonts.poppins(
                    color: black, fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Gap(15),
              _draftProvider.draftsList!.isEmpty
                  ? Column(
                      children: [
                        Image.asset('assets/nothing-found.png', height: 300),
                        Text('You have no Drafts',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: black)),
                      ],
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: _draftProvider.draftsList!.length,
                      separatorBuilder: (context, int) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return DraftsWidget(
                          title: _draftProvider.draftsList![index]!.title
                              .toString(),
                          date: _draftProvider.draftsList![index]!.createdAt
                              .toString(),
                        );
                      })
            ]),
    ));
  }
}
