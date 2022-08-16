import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/comment_controller.dart';
import 'package:genesys_blog/controllers/home_page_controller.dart';
import 'package:genesys_blog/controllers/post_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopViewNewsPage extends ConsumerStatefulWidget {
  String id;
  DesktopViewNewsPage({Key? key, required this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DesktopViewNewsPageState();
}

class _DesktopViewNewsPageState extends ConsumerState<DesktopViewNewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostController postController = ref.read(postProvider);

    postController.loadNewsById(widget.id);
    CommentController commentController = ref.read(commentProvider);
  }

  @override
  Widget build(BuildContext context) {
     PostController postController = ref.watch(postProvider);
    CommentController commentController = ref.watch(commentProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: postController.load
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
                const Gap(45),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: CachedNetworkImage(
                      imageUrl: postController.news!.image.toString(),
                      height: 400,
                      width: 800,
                      fit: BoxFit.fill),
                ),
                const Gap(66),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/comments.png',
                            height: 20,
                            width: 20,
                          ),
                          const Text('15 comments'),
                        ],
                      ),
                      const Gap(24),
                      Column(
                        children: [
                          SizedBox(
                              height: 20,
                              width: 20,
                              child: Text('${postController.news!.views}')),
                          const Text('VIEWS'),
                        ],
                      ),
                      const Gap(24),
                      Container(
                        width: 257,
                        height: 47,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/facebook.png',
                              height: 24,
                              width: 24,
                            ),
                            const Gap(10),
                            Text('Share on facebook',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: darkBlueColor,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const Gap(24),
                      Container(
                        width: 257,
                        height: 47,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/twitter.png',
                              height: 24,
                              width: 24,
                            ),
                            const Gap(10),
                            Text('Share on twitter',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    ],
                  ),
                ),
                const Gap(25),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: SizedBox(
                      height: 379,
                      child: Text(
                        postController.news!.body.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                ),
                const Gap(73),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Text('Leave a Reply',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: black,
                          fontWeight: FontWeight.w500)),
                ),
                const Gap(17),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Text(
                      'Your email address will not be published. Required fields are marked *',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w400)),
                ),
                const Gap(33),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Text('Comment',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w400)),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: TextField(
                    controller: commentController.userCommentController,
                    maxLines: 20,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: black))),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Text('Name',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w400)),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: TextField(
                    controller: commentController.firstNameController,
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: black))),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: Text('Email',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w400)),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: TextField(
                    controller: commentController.emailController,
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: black))),
                  ),
                ),
                const Gap(31),
                Padding(
                  padding: const EdgeInsets.only(left: 77, right: 77),
                  child: ElevatedButton(
                    onPressed: () {
                      if (commentController.validate()) {}
                    },
                    child: const Text('Post comment'),
                    style: ElevatedButton.styleFrom(
                        primary: darkBlueColor, fixedSize: const Size(214, 72)),
                  ),
                ),
                const Gap(100),
                Center(
                  child: Text('blog @2022 copyright All rights reserved',
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w400)),
                ),
                const Gap(150),
              ]),
      ),
    );
  }
}
