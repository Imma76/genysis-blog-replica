import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:genesys_blog/controllers/user_controller.dart';
import 'package:genesys_blog/views/desktop_view/users_dashboard.dart';
import 'package:genesys_blog/widgets/category.dart';
import 'package:genesys_blog/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:markdown/markdown.dart' as md;
import '../../controllers/all_providers/all_providers.dart';

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
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostController postController = ref.read(postProvider);
    postController.getUserPosts();
    UserController _userController = ref.read(userProvider);
    // _userController.init();
  }

  @override
  Widget build(BuildContext context) {
    PostController postController = ref.watch(postProvider);
    UserController _userController = ref.watch(userProvider);

    return SingleChildScrollView(
      child: postController.load
          ? Center(
              child: CircularProgressIndicator(
              color: darkBlueColor,
            ))
          : Column(
              children: [
                const Gap(40),
                Padding(
                  padding: const EdgeInsets.only(left: 44.0),
                  child: Row(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            DashboardMetricsWidget(
                              width: 391,
                              boxType: 'Posts',
                              imagePath: 'assets/post.png',
                              mertricNumber:
                                  '${postController.userPosts!.length}',
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
                               height:500,
                              width: 600,
                              child: Markdown(
                                controller: scrollController,
                                selectable: true,
                                data: 'Insert emoji :smiley: here',
                                extensionSet: md.ExtensionSet(
                                  md.ExtensionSet.gitHubFlavored
                                      .blockSyntaxes,
                                  [
                                    md.EmojiSyntax(),
                                    ...md.ExtensionSet.gitHubFlavored
                                        .inlineSyntaxes
                                  ],
                                ),
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
                                        color:
                                            filterOption.contains(option.name)
                                                ? Colors.white
                                                : darkBlueColor,
                                        width:
                                            filterOption.contains(option.name)
                                                ? 3.0
                                                : 1.0),
                                    backgroundColor: Colors.white,
                                    disabledColor: white,
                                    selectedColor: darkBlueColor,
                                    selected:
                                        filterOption.contains(option.name),
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
                                    labelStyle:
                                        const TextStyle(color: Colors.red),
                                    label: Text(option.name,
                                        style: TextStyle(
                                            color: filterOption
                                                    .contains(option.name)
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
    );
  }
}
