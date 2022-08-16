import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:genesys_blog/constant.dart';
import 'package:genesys_blog/controllers/all_providers/all_providers.dart';
import 'package:genesys_blog/controllers/comment_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsWidget extends StatelessWidget {
  final double? height, width, textWidth;
  final String? image, title, body;
  const NewsWidget(
      {Key? key,
      this.height = 365,
      this.image,
      this.body,
      this.title,
      this.width = 523,
      this.textWidth = 530})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: image.toString(),
          height: 365,
          width: 523,  placeholder:
                                                          (context, image) {
                                                        return Image.asset(
                                                            'assets/placeholder.png');
                                                      },
          fit: BoxFit.fill,
        ),
        const Gap(24),
        const Text('June 24, 2022'),
        const Gap(15),
        TitleWidget(
          width: 530,
          title: title,
        ),
        const Gap(15),
        SizedBox(
          width: textWidth,
          child: Text(body.toString(),
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: black,
                fontWeight: FontWeight.w400,
              )),
        ),
        Text('Read More', style: TextStyle(color: lightBlue)),
      ],
    );
  }
}

class TitleWidget extends StatelessWidget {
  final double? width;
  final double? fontSize;
  final String? title;
  const TitleWidget({Key? key, this.title, this.width, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(title.toString(),
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            color: black,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}

class UserPostsWidget extends ConsumerStatefulWidget {
  final String? views, articleId;
  const UserPostsWidget({Key? key, this.views, this.articleId})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserPostsWidgetState();
}

class _UserPostsWidgetState extends ConsumerState<UserPostsWidget> {
   @override
    void initState() {
      super.initState();
      CommentController commentController = ref.read(commentProvider);
      commentController.getCommentBbyArticleId(widget.articleId.toString());
    }

  @override
  Widget build(BuildContext context) {
     CommentController commentController = ref.watch(commentProvider);
   
    return Container(
      height: 124,
      width: 391,
      padding: const EdgeInsets.all(8),
      child:commentController.load ? Center(
                child: CircularProgressIndicator(
                color: darkBlueColor,
              ))
            :Column(
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
              Text(widget.views.toString(),
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 12)),
              const Gap(7),
              Image.asset('assets/comments.png', width: 14, height: 12), const Gap(7),
              Text(commentController.commentList!.length.toString(),
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
// class UserPostsWidget extends StatelessWidget {
//   const UserPostsWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
