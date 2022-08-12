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

class UserPost extends ConsumerStatefulWidget {
  const UserPost({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPostState();
}

class _UserPostState extends ConsumerState<UserPost> {
  List filterOption = [];
  bool selected = false;

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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120),
                          child: Text('Genesys Blog',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: white)),
                        ),
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
                  Container(
                      color: lightGrey,
                      height: MediaQuery.of(context).size.height,
                      width: 2),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Create New Post',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: black)),
                        // SizedBox(
                        //   height:150,
                        //   child:
                        // )
                        const Gap(35),
                        SizedBox(
                          width: 600,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: black))),
                          ),
                        ),
                        SizedBox(
                          // height:500,
                          width: 600,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              MarkdownTextInput(
                                (String value) =>
                                    setState(() => description = value),
                                description,
                                label: 'Description',
                                maxLines: 20,
                                actions: MarkdownType.values,
                                controller: controller,
                              ),
                            ],
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     controller.clear();
                        //   },
                        //   child: const Text('Clear'),
                        // ),

                        const Gap(20),
                        Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: Category.values.map((option) {
                              return FilterChip(
                                showCheckmark: false,
                                checkmarkColor: Colors.white,
                                side: BorderSide(
                                    color: filterOption.contains(option.name)
                                        ? Colors.white
                                        : darkBlueColor,
                                    width: filterOption.contains(option.name)
                                        ? 3.0
                                        : 1.0),
                                backgroundColor: Colors.white,
                                disabledColor: white,
                                selectedColor: darkBlueColor,
                                selected: filterOption.contains(option.name),
                                onSelected: (isSelected) {
                                  setState(() {
                                    if (isSelected) {
                                      filterOption.clear();
                                      //print(controller.currentPlace);
                                      //currentIndex.value = option[ndex]
                                      // controller.getLocationData(
                                      //     category: option.name,
                                      //     city: controller
                                      //         .currentPlace.value);

                                      filterOption.add(option.name);
                                      selected = true;
                                    } else {
                                      selected = false;
                                      // filterOptions.remove(option.name.obs);
                                    }
                                  });
                                },
                                labelStyle: const TextStyle(color: Colors.red),
                                label: Text(option.name,
                                    style: TextStyle(
                                        color:
                                            filterOption.contains(option.name)
                                                ? Colors.white
                                                : darkBlueColor)),
                              );
                            }).toList()),
                        const Gap(20),

                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Post'),
                          style: ElevatedButton.styleFrom(
                              primary: darkBlueColor,
                              fixedSize: const Size(74, 52)),
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
