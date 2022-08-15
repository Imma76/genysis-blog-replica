import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 44.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Gap(20),
        const DashboardMetricsWidget(
          width: 391,
          boxType: 'Drafts',
          imagePath: 'assets/post.png',
          mertricNumber: '10',
        ),Gap(70),
        Text('All Drafts',
              style: GoogleFonts.poppins(
                  color: black, fontSize: 20, fontWeight: FontWeight.w400),),Gap(15),
        ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, int) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return const DraftsWidget();
            })
      ]),
    ));
  }
}
