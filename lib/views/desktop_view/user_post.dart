import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

class UserPost extends ConsumerStatefulWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPostState();
}

class _UserPostState extends ConsumerState<UserPost> {
  TextStyle textStyle = GoogleFonts.poppins(
      color: lightGrey, fontWeight: FontWeight.w400, fontSize: 12);
  TextAlign textAlign = TextAlign.start;
  String description = 'My great package';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 114,
                width: double.infinity,
                color: darkBlueColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(17),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Text('Genesys Blog',
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: white)),
                    ),
                  ],
                )),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.only(left: 44.0),
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const DashboardMetricsWidget(
                          width: 391,
                          boxType: 'Posts',
                          imagePath: 'assets/post.png',
                          mertricNumber: '10',
                        ),
                        const Gap(50),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: 391,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: UserPostsWidget(),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right:30.0),
                    child: Column( 
                      //mainAxisSize: MainAxisSize.min,
                        //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        
                        // SizedBox(
                        //   height:150,
                        //   child:
                        // )
                         SizedBox(
                          width:600,
                           child: TextField(       maxLines: 1,
                decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(color: black))),),
                         ),
                        SizedBox(
                         // height:500,
                          width:600,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              MarkdownTextInput(
                                (String value) => setState(() => description = value),
                                description,
                                label: 'Description',
                              maxLines: 20,
                                actions: MarkdownType.values,
                                controller: controller,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.clear();
                          },
                          child: const Text('Clear'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            description,
                            //   shrinkWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ), 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserPostsWidget extends StatelessWidget {
  const UserPostsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 391,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Imperdiet posuere tellus est mi fames sit tincidunt magna bibendum.',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  color: black, fontWeight: FontWeight.w500, fontSize: 16)),
          const Gap(8),
          Text('Published 10 jan',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  color: lightGrey, fontWeight: FontWeight.w400, fontSize: 12)),
          const Gap(12),
          Row(
            children: [
              Image.asset('assets/views.png', width: 14, height: 12),
              Text('4',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Gap(7),
              Image.asset('assets/comments.png', width: 14, height: 12),
              Text('12',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Spacer(),
              Text('Edit',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Gap(20),
              Text('Delete',
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(border: Border.all(color: lightGrey)),
    );
  }
}
